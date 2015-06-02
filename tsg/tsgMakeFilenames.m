function [ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( sGridName )
%
% [ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( sGridName )
%
% given the paths from tsgGetPaths() it returns the filenames of all files associated with the name
%

[ sFiles, sTasGrid ] = tsgGetPaths();

gFile = [sFiles,'gFile_',sGridName]; % the filename to store the grid

qFile = [sFiles,'qFile_',sGridName]; % file with the quadrature points

vFile = [sFiles,'vFile_',sGridName]; % file with values to be loaded

wFile = [sFiles,'wFile_',sGridName]; % file with anisotropic weights

pFile = [sFiles,'pFile_',sGridName]; % file with points to evaluate the surrogate

rFile = [sFiles,'rFile_',sGridName]; % file with the result of the evaluation

end