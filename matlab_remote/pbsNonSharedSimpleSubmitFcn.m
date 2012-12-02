function pbsNonSharedSimpleSubmitFcn(scheduler, job, props, ...
                                        clusterHost, remoteDataLocation)
%PBSNONSHAREDSIMPLESUBMITFCN Submits a MATLAB job to a PBS scheduler in the
% absence of a shared file system between the MATLAB client and the
% PBS scheduler.
%
% See also pbsNonSharedSimpleDecodeFcn.

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
decodeFcn = 'pbsNonSharedSimpleDecodeFcn';

% Read the number of tasks which are to be created. This property
% cannot be changed.
numberOfTasks = props.NumberOfTasks;

% A unique file and directory name for the job. This is used to create
% files and a directory under scheduler.DataLocation
jobLocation = props.JobLocation;

% A cell array of unique file names for tasks. These are used to create
% files under jobLocation
taskLocations = props.TaskLocations;

% Since PBS jobs will be submitted from a UNIX host on the cluster, 
% a single quoted string will protect the MATLAB command.
quote = '''';

% The MATLAB command to be run on a cluster node to execute a task.
commandToRun = [ quote props.MatlabExecutable quote ' ' ...
                 props.MatlabArguments ];

% Copy the matlab_metadata.mat file to the remote host.
localMetaDataFile = [ localDataLocation '/matlab_metadata.mat' ];
copyDataToCluster(localMetaDataFile, remoteDataLocation, clusterHost);

% Copy the local job directory to the remote host.
localJobDirectory = [ localDataLocation '/' jobLocation ];
copyDataToCluster(localJobDirectory, remoteDataLocation, clusterHost);

% Copy the local job files to the remote host.
localJobFiles = [ localDataLocation '/' jobLocation '.*' ];
copyDataToCluster(localJobFiles, remoteDataLocation, clusterHost);

% Submit tasks which the scheduler will execute by starting MATLAB workers.
for i = 1:numberOfTasks
    taskLocation = taskLocations{i};
    remoteJobDir = [ remoteDataLocation '/' jobLocation ];

    % Create a script to submit a PBS job.
    localScript = createPBSSubmitScript(commandToRun, decodeFcn, ...
        props.StorageConstructor, remoteDataLocation, ...
        jobLocation, taskLocation, quote);
    [Path, scriptName] = fileparts(localScript);

    % Copy the script to the remote host.
    copyDataToCluster(localScript, remoteJobDir, clusterHost);

    % Create the command to run on the remote host.
    remoteScriptLocation = [ remoteJobDir '/' scriptName ];
    remoteCommand = sprintf('qsub %s', remoteScriptLocation);

    % Execute the submit command on the remote host.
    runCmdOnCluster(remoteCommand, clusterHost);

    % Delete the local copy of the script
    delete(localScript);
end


function filename = createPBSSubmitScript(commandToRun, decodeFunction, ...
         storageConstructor, remoteDataLocation, jobLocation, ...
         taskLocation, quote)
%Create a PBS submit script that forwards the required environment
%variables and runs a MATLAB worker.
logFileLocation = [quote remoteDataLocation '/' taskLocation '.log' quote];

% Create the commands to set the environment variables.
% "-N Job#"  specifies the job name
% "-j oe" joins together output and error streams
% "-o ..." specifies where standard output goes to
setEnv = sprintf([ ...
    '#!/bin/sh', '\n', ...
    '#PBS -N MATLAB_', taskLocation,  '\n', ...
    '#PBS -j oe', '\n', ...
    '#PBS -o ', logFileLocation, '\n', ...
    '#PBS -Wgroup_list=matlab\n', ...   %snow
     '#PBS -q pmatlab_q\n', ... %snow
    '#PBS -lpartition=ITHACA\n', ... %snow    
    '#PBS -A matlab0001\n', ... %snow
    '#PBS -v MDCE_DECODE_FUNCTION=', decodeFunction, ',', ...
    'MDCE_STORAGE_LOCATION=', remoteDataLocation, ',', ...
    'MDCE_STORAGE_CONSTRUCTOR=', storageConstructor, ',', ...
    'MDCE_JOB_LOCATION=', jobLocation, ',', ...
    'MDCE_TASK_LOCATION=', taskLocation, ',', ...
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
