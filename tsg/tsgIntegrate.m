function [ result ] = tsgIntegrate( lGrid )
%
% [ result ] = tsgIntegrate( lGrid )
%
% integrates the intepolant and returns the result
% this should be called after the grid has been created and after values
% have been loaded
%
% INPUT:
%
% lGrid: a grid list created by makeGrid(...)
%
%
% OUTPUT:
%
% result: an array of size [ whatever, outputs ]
%         the values of the interpolant at the corresponding points
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -integrate'];

sCommand = [ sCommand, ' -gridfile ', gFile];

sCommand = [ sCommand, ' -of ', rFile];


eval(['! ',sCommand]);

[ result ] = tsgReadMatrix( rFile );

end

