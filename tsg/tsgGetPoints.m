function [ points ] = tsgGetPoints( lGrid )
%
% [ points ] = tsgGetPoints( lGrid )
%
% retreives the points associated with an existing grid
%
% INPUT:
%
% lGrid: a grid list created by makeGrid(...)
%
% OUTPUT:
%
% points: the points of the grid in an array of dimension [ num_poits, dim ]
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -getpoints'];

sCommand = [ sCommand, ' -gridfile ', gFile];

sCommand = [ sCommand, ' -of ', qFile];

eval(['! ',sCommand]);

[ points ] = tsgReadMatrix( qFile );

end
