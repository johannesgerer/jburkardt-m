function [ newp ] = tsgRefineGrid( lGrid, tolerance, criteria )
%
% [ newp ] = tsgRefineGrid( lGrid, tolerance, criteria )
%
% uses the values stored in the grid and the algorithm specified by
% criteria and tolerance to generate a new set of points
%
% INPUT:
%
% lGrid: a grid list created by tsgMakeGrid(...)
%
% tolerance: a number used as cut-off for the refinement selection criteria
%
% criteria: string from <classic/parents/direction/fds>
%           determines the selection algorithm
%
% OUTPUT:
%
% newp: (optional) the new points associated with the new grid in an array
%       of dimension [ num_new_poits, dim ]
%
% NOTE: lGrid gets modified
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -refine'];

sCommand = [ sCommand, ' -gridfile ', gFile ];

sCommand = [ sCommand, ' -tol ', num2str(tolerance) ];

sCommand = [ sCommand, ' -rt ', criteria ];

if ( nargout > 0 )
    sCommand = [ sCommand, ' -of ', qFile ];
end

[status, cmdout] = system(sCommand);

if ( size( findstr( 'ERROR', cmdout ) ) ~= [ 0, 0 ] )
    disp(cmdout);
    fprintf(2,['Erors were encountered\n']);
    return;
else
    if ( nargout > 0 )
        newp = tsgReadMatrix( qFile );
    end
end

end
