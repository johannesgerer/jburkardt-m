function [ weights ] = tsgGetInterpolationWeights( lGrid, points )
%
% [ result ] = tsgGetInterpolationWeights( lGrid, points )
%
% it gives the weights for interpolation associated with each point
% this does not require a call to loadValues
% this does not require out > 0 for makeGrid(...)
%
% INPUT:
%
% lGrid: a grid list created by makeGrid(...)
%
% points: an array of size [ whatever, dimensions ]
%         specifies the points where the interpolant should be evaluated
%
%
% OUTPUT:
%
% result: an array of size [ whatever, number_of_points ]
%         the values associated with the interpolant at those points
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -getinterweights'];

sCommand = [ sCommand, ' -gridfile ', gFile];

tsgWriteMatrix( vFile, points );

sCommand = [ sCommand, ' -if ', vFile];

sCommand = [ sCommand, ' -of ', rFile];


disp(sCommand);
eval(['! ',sCommand]);

[ weights ] = tsgReadMatrix( rFile );

end

