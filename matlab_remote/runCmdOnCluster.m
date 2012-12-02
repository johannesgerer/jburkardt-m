function runCmdOnCluster(command, clusterHost)
%RUNCMDONCLUSTER Runs a command on a remote host.

% Copyright 2006 The MathWorks, Inc.

% Use ssh to run a command on the remote host.
cmdForCluster = sprintf('ssh %s "%s"', clusterHost, command);

[s, r] = system(cmdForCluster);
if s ~= 0
    error('distcomp:scheduler:FailedRemoteOperation', ...
        ['Failed to run the command\n' ...
        '"%s"\n"' ...
        'on the host "%s".\n' ...
        'Command Output:\n' ...
        '"%s"\n' ...
        ], command, clusterHost, r);
else
    fprintf('%s\n', r);
end
