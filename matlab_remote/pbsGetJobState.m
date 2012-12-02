function state = pbsGetJobState(scheduler, job, state)
%pbsGetJobState Gets the state of a job on a cluster.
%
% Set your schedulers's GetJobStateFcn to this function using the following
% command (see README):
%     set(sched, 'GetJobStateFcn', @pbsGetJobState);

%  Copyright 2006-2008 The MathWorks, Inc.

mlock;
persistent jobsToMonitorNames;

if isempty(jobsToMonitorNames)
    jobsToMonitorNames = {};
end

if isempty(scheduler.UserData)
    if ~iscell(scheduler.SubmitFcn) || length(scheduler.SubmitFcn) < 3
        error('distcomp:genericscheduler:SubmitFcnError',...
              'SubmitFcn must include clusterHost and remoteDataLocation as extra arguments.');
    end    
    scheduler.UserData={ scheduler.SubmitFcn{2} ; scheduler.SubmitFcn{3} };
end

jobName = job.pGetEntityLocation;
if strcmp(state, 'finished') 
% emc 6 March 2010 replace setxor with setdiff - behavior with empty set
      jobsToMonitorNames = setdiff(jobsToMonitorNames, {jobName});                            
else
%   timerName as suggested by Ray Norris TMW 5 March 2010   
%   timerName = [job.Name '_' num2str(job.ID)];
%   timerName emc 6 March 2010  
    timerName = [job.Name '_' strrep(job.SubmitTime, ' ','_')];
    if strcmp(state, 'queued') || strcmp(state, 'running')
        if ~ismember(jobName, jobsToMonitorNames) || ...
                                    isempty(timerfind('Name',timerName))
            jobsToMonitorNames = union(jobsToMonitorNames, {jobName});
            jobStateTimer = ...
                      timer('Period', 10.0, 'ExecutionMode', 'fixedRate');
            set(jobStateTimer, 'TimerFcn', ...
                         { @copyJobFilesIfFinished, scheduler, job }, ...
                                                        'Name',timerName);
            start(jobStateTimer);
        end
    end
end
