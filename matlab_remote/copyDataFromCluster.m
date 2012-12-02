function copyDataFromCluster(localLoc, remoteLoc, clusterHost)
%COPYDATAFROMCLUSTER Copies files or directories from a location
% on a remote host to the local machine.

% Copyright 2006 The MathWorks, Inc.

% Use scp to copy files.
copyCmd = sprintf('scp -r "%s:%s" %s', clusterHost, remoteLoc, localLoc);

[s, r] = system(copyCmd);
if s ~= 0
    error('distcomp:scheduler:FailedRemoteOperation', ...
        ['Failed to copy files from "%s" on the host "%s"\n' ...
        'to "%s".\n' ...
        'Command Output:\n' ...
        '"%s"\n' ...
        ], remoteLoc, clusterHost, localLoc, r);
end
