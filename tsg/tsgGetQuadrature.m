function [ weights, points ] = tsgGetQuadrature( lGrid )
%
% [ weights, points ] = tsgGetQuadrature( lGrid )
%
% retreives the quadrature points and weights from an existing grid
%
% INPUT:
%
% lGrid: a grid list created by makeGrid(...)
%
% OUTPUT:
%
% weights and poins are self explanatory
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -getquadrature'];

sCommand = [ sCommand, ' -gridfile ', gFile];

sCommand = [ sCommand, ' -of ', qFile];

disp(sCommand);
eval(['! ',sCommand]);

[ q ] = readMatrix( qFile );

weights = q(:,1);
points = q(:,2:end);

end

