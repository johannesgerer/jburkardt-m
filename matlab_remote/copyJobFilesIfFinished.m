function copyJobFilesIfFinished(jobStateTimer, eventData, scheduler, job)
%COPYJOBFILESIFFINISHED Copy the job files of a finished job to the
% client machine.

% Copyright 2006-2008 The MathWorks, Inc.

% Make sure that the job is valid
if isempty(job) || isempty(findstr(class(job), 'distcomp'))
    iStopAndDeleteTimer(jobStateTimer);
    return;
end

% If the job has already finished, stop the timer and return.
state = iGetLocalJobState(job);
if strcmp(state, 'finished')
    iStopAndDeleteTimer(jobStateTimer);
    return;
end

userData = scheduler.UserData;
clusterHost = userData{1};
remoteDataLocation = userData{2};
localDataLocation = scheduler.DataLocation;
jobLocation = job.pGetEntityLocation;

% Copy the state file back from the cluster. If the file does not 
% exist or there are problems copying it, destroy the timer.
try
    iCopyJobStateFile(localDataLocation, remoteDataLocation, ...
        jobLocation, clusterHost);
catch err
    iStopAndDeleteTimer(jobStateTimer);
    error('distcomp:genericscheduler:GetJobState', ...
        ['Unable to access files in directory %s on host %s', ...
        'because of error\n%s\n', ...
        'You will need to manually copy files from %s on host %s\n', ...
        'to the local directory %s.\n', ...
        'To stop seeing this message, cancel Job %s.'
        ], remoteDataLocation, ...
        clusterHost, err.message, remoteDataLocation, clusterHost, ...
        localDataLocation, num2str(job.ID));
end

% Find the state of the job.
state = iGetLocalJobState(job);

% If the job has just finished, copy back the data from the cluster.
if strcmp(state, 'finished')
    iStopAndDeleteTimer(jobStateTimer);
    try
        iCopyJobDirectory(localDataLocation, remoteDataLocation, ...
            jobLocation, clusterHost);
        iCopyJobFiles(localDataLocation, remoteDataLocation, ...
            jobLocation, clusterHost);
    catch err
        error('distcomp:genericscheduler:GetJobOutput', ...
            ['Unable to access files in directory %s on host %s', ...
            'because of error\n%s\n', ...
            'You will need to manually copy files from %s\n', ...
            'on host %s\n', ...
            'to the local directory %s\n', ...
            'To stop seeing this message, cancel Job %s.'
            ], remoteDataLocation, ...
            clusterHost, err.message, remoteDataLocation, clusterHost, ...
            localDataLocation, num2str(job.ID));
    end
end


function state = iGetLocalJobState(job)
serializer = job.pReturnSerializer;
if ~isempty(serializer)
    state = char(serializer.getField(job, 'state'));
end


function iCopyJobStateFile(localDataLocation, remoteDataLocation, ...
    jobLocation, clusterHost)
remoteJobStateFile = [ remoteDataLocation '/' jobLocation '.state.mat' ];
copyDataFromCluster(localDataLocation, remoteJobStateFile, clusterHost);


function iCopyJobDirectory(localDataLocation, remoteDataLocation, ...
    jobLocation, clusterHost)
remoteJobDirectory = [ remoteDataLocation '/' jobLocation ];
copyDataFromCluster(localDataLocation, remoteJobDirectory, clusterHost);


function iCopyJobFiles(localDataLocation, remoteDataLocation, ...
    jobLocation, clusterHost)
remoteJobFiles = [ remoteDataLocation '/' jobLocation '.*' ];
copyDataFromCluster(localDataLocation, remoteJobFiles, clusterHost);


function iStopAndDeleteTimer(jobStateTimer)
stop(jobStateTimer);
delete(jobStateTimer);
