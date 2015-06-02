function tsgDeleteGrid( lGrid )
%
% tsgDeleteGrid( lGrid )
%
% deletes all of the background files used by the grid
%
% INPUT:
%
% lGrid: a grid list created by tsgMakeGrid(...)
%
% NOTE: lGrid gets deleted and it can no longer be used
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [ 'rm -fr ',gFile,' ',qFile,' ',vFile,' ',wFile,' ',pFile,' ',rFile];

[status, cmdout] = system(sCommand);
disp(cmdout);


end

