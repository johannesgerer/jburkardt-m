function copyDataToCluster(localLoc, remoteLoc, clusterHost)
%COPYDATATOCLUSTER Copies files or directories from the local machine
% to a location on a remote host.

% Copyright 2006 The MathWorks, Inc.

% Use scp to copy files.
copyCmd = sprintf('scp -r %s "%s:%s"', localLoc, clusterHost, remoteLoc);

[s, r] = system(copyCmd);
if s ~= 0
    error('distcomp:scheduler:FailedRemoteOperation', ...
        ['Failed to copy files from "%s"\n' ...
        'to "%s" on the host "%s".\n' ...
        'Command Output:\n' ...
        '"%s"\n' ...
        ], localLoc, remoteLoc, clusterHost, r);
end
