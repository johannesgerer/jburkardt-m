function [ newp ] = tsgGetNeededPoints( lGrid )
%
% [ points ] = tsgGetNeededPoints( lGrid )
%
% retreives the points needed to perform interpolation
% initially tsgGetNewPoints(...) will return the same as tsgGetPoints(...)
% if values for an interpolant are loaded and then refine/recycle are used
% then tsgGetNewPoints() will return the new points associated with the updated
% grid
% until all new points are set, evaluate will use the old interpolant
%
% INPUT:
%
% lGrid: a grid list created by tsgMakeGrid(...)
%
% OUTPUT:
%
% points: the points of the grid in an array of dimension [ num_poits, dim ]
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -getneededpoints'];

sCommand = [ sCommand, ' -gridfile ', gFile];

sCommand = [ sCommand, ' -of ', qFile];

[status, cmdout] = system(sCommand);

if ( size( findstr( 'ERROR', cmdout ) ) ~= [ 0, 0 ] )
    disp(cmdout);
    fprintf(2,['Erors were encountered\n']);
    return;
else
    [ newp ] = tsgReadMatrix( qFile );
end

end
