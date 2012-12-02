function pbsNonSharedParallelSubmitFcn(scheduler, job, props, ...
                                        clusterHost, remoteDataLocation)
%PBSNONSHAREDPARALLELSUBMITFCN Submits a parallel MATLAB job to a PBS 
% scheduler in the absence of a shared file system between the MATLAB 
% client and the PBS scheduler.
%
% See also pbsNonSharedParallelDecodeFcn.

% Copyright 2006-2008 The MathWorks, Inc.

if ~ischar(clusterHost)
    error('distcomp:genericscheduler:SubmitFcnError', ...
        'Hostname must be a string');
end
if ~ischar(remoteDataLocation)
    error('distcomp:genericscheduler:SubmitFcnError', ...
        'Remote Data Location must be a string');
end
scheduler.UserData = { clusterHost ; remoteDataLocation }; 
localDataLocation = scheduler.DataLocation; 

% Set the name of the decode function which will be executed by
% the worker. The decode function must be on the path of the MATLAB
% worker when it starts up. This is typically done by placing the decode
% function in MATLABROOT/toolbox/local on the cluster nodes, or by
% prefixing commandToRun (created below) with a command to cd to the
% directory where the decode function's M file exists.
decodeFcn = 'pbsNonSharedParallelDecodeFcn'; 

% A unique file and directory name for the job. This is used to create
% files and a directory under scheduler.DataLocation
jobLocation = props.JobLocation; 

% Since PBS jobs will be submitted from a UNIX host on the cluster, 
% a single quoted string will protect the MATLAB command.
quote = '''';

% Copy the matlab_metadata.mat file to the remote host.
localMetaDataFile = [ localDataLocation '/matlab_metadata.mat' ]; 
copyDataToCluster(localMetaDataFile, remoteDataLocation, clusterHost);

% Copy the local job directory to the remote host.
localJobDirectory = [ localDataLocation '/' jobLocation ]; 
copyDataToCluster(localJobDirectory, remoteDataLocation, clusterHost);

% Copy the local job files to the remote host.
localJobFiles = [ localDataLocation '/' jobLocation '.*' ];
copyDataToCluster(localJobFiles, remoteDataLocation, clusterHost);


% Directory on remote host where the submit script as well as the 
% parallel wrapper script will be written.
remoteJobDir = [ remoteDataLocation '/' jobLocation ];

% The name of the script that will run the parallel job.
parallelWrapperScriptName = 'pbsParallelWrapper.sh';
% The wrapper script is in the same directory as this M-file
[dirpart] = fileparts( mfilename( 'fullpath' ) );
parallelWrapperScript = fullfile( dirpart, parallelWrapperScriptName );

% The command that will be executed to run the paralle job.
commandToRun = ['sh ' quote remoteJobDir '/' parallelWrapperScriptName quote];

% Choose a number of processors per node to use (you will need to customize
% this section to match your cluster)
procsPerNode = 8;	% SNOW - ithaca has 8 cores per node
numberOfNodes = ceil( props.NumberOfTasks / procsPerNode );
             
% Create a script that will set environment variables and then submit 
% a parallel job to PBS.
localScript = createPBSSubmitScript(commandToRun, decodeFcn, ...
    props.StorageConstructor, remoteDataLocation, jobLocation, ...
    scheduler.ClusterMatlabRoot, props.MatlabExecutable, ...
    props.MatlabArguments, props.NumberOfTasks, ...
    procsPerNode, numberOfNodes, quote);

[path, scriptName] = fileparts(localScript);

% Copy the submit script to the remote host.
copyDataToCluster(localScript, remoteJobDir, clusterHost);

% Copy the paraller wrapper script to the remote host.
% The wrapper script is in the same directory as this M-file.
copyDataToCluster(parallelWrapperScript, remoteJobDir, clusterHost);

% Create the command to run on the remote host.
remoteScriptLocation = [ remoteJobDir '/' scriptName ];
remoteCommand = sprintf('qsub %s', remoteScriptLocation);

% Execute the submit command on the remote host.
runCmdOnCluster(remoteCommand, clusterHost);

% Delete the local copy of the script
delete(localScript);


function filename = createPBSSubmitScript(commandToRun, decodeFunction, ...
        storageConstructor, remoteDataLocation, jobLocation, ...
        clusterMatlabRoot, matlabExecutable, matlabArguments, ...
        numberOfTasks, procsPerNode, numberOfNodes, quote)
% Create a PBS submit script that forwards the required environment
% variables and runs MATLAB workers.

% Remove leading whitespace from the MATLAB arguments.
[t, r] = strtok(matlabArguments);
matlabArguments = [t r];

% Provide the name of a unique log file for this job. Use quotes
% in case there is a space in scheduler.DataLocation. If PBS fails
% to write to the log file, an e-mail will be sent to the user.
logFileLocation = [quote remoteDataLocation '/' jobLocation '/' ...
                   jobLocation '.log' quote];

% Create the commands to set the environment variables.
% "-N Job#"  specifies the job name
% "-j oe" joins together output and error streams
% "-o ..." specifies where standard output goes to
% "-l nodes ... " specifies the number of nodes and processes per nodes
setEnv = sprintf([ ...
    '#!/bin/sh', '\n', ...
    '#PBS -N MATLAB_', jobLocation,  '\n', ...
    '#PBS -j oe', '\n', ...
    '#PBS -o ', logFileLocation, '\n', ...
    '#PBS -l nodes=', num2str(numberOfNodes), ...
    ':ppn=', num2str(procsPerNode), ':pmatlab\n', ...
    '#PBS -Wgroup_list=matlab\n', ...   %snow
    '#PBS -q pmatlab_q\n', ... %snow
    '#PBS -lpartition=ITHACA\n', ... %snow
    '#PBS -A matlab0001\n', ... %snow
    '#PBS -v MDCE_DECODE_FUNCTION=', decodeFunction, ',', ...
    'MDCE_STORAGE_LOCATION=', remoteDataLocation, ',', ...
    'MDCE_STORAGE_CONSTRUCTOR=', storageConstructor, ',', ...
    'MDCE_CMR=', clusterMatlabRoot, ',', ...
    'MDCE_MATLAB_EXE=', matlabExecutable, ',', ...
    'MDCE_MATLAB_ARGS=', matlabArguments, ',', ...
    'MDCE_JOB_LOCATION=', jobLocation, ',', ...
    'MDCE_TOTAL_TASKS=', num2str(numberOfTasks), ',', ...
    'MDCE_DEBUG=', 'true', ...
    '\n', ...
    ]);

% Content of script.
scriptContent = sprintf('%s%s', setEnv, commandToRun);

% Create script.
filename = tempname;
% Open file in binary mode to make it cross-platform.
fid = fopen(filename, 'w');
fprintf(fid, scriptContent);
fclose(fid);
