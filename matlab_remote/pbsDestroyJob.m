function pbsDestroyJob(scheduler, job)
%pbsDestroyJob Destroys job files on a remote host.
%
% Set your schedulers's DestroyJobFcn to this function using the following
% command (see README):
%     set(sched, 'DestroyJobFcn', @pbsDestroyJob);

%  Copyright 2006-2008 The MathWorks, Inc.

userData = scheduler.UserData;
clusterHost = userData{1};
remoteDataLocation = userData{2};
jobLocation = job.pGetEntityLocation;
remoteJobDirectory = [ remoteDataLocation '/' jobLocation ];
remoteJobFiles = [ remoteDataLocation '/' jobLocation '.*' ];

%Remote destroy commands to run
destroyRemoteJobDirectory = sprintf('rm -rf %s', remoteJobDirectory);
destroyRemoteJobFiles = sprintf('rm -rf %s', remoteJobFiles);

% Execute the destroy commands on the remote host.
runCmdOnCluster(destroyRemoteJobDirectory, clusterHost);
runCmdOnCluster(destroyRemoteJobFiles, clusterHost);
