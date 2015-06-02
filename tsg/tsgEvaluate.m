function [ result ] = tsgEvaluate( lGrid, points )
%
% [ result ] = tsgEvaluate( lGrid, points )
%
% evaluates the intepolant at the points of interest and returns the result
% this should be called after the grid has been created and after values
% have been loaded
%
% INPUT:
%
% lGrid: a grid list created by tsgMakeGrid(...)
%
% points: an array of size [ whatever, dimensions ]
%         specifies the points where the interpolant should be evaluated
%
%
% OUTPUT:
%
% result: an array of size [ whatever, outputs ]
%         the values of the interpolant at the corresponding points
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -evaluate'];

sCommand = [ sCommand, ' -gridfile ', gFile];

tsgWriteMatrix( vFile, points );

sCommand = [ sCommand, ' -if ', vFile];

sCommand = [ sCommand, ' -of ', rFile];


[status, cmdout] = system(sCommand);

if ( size( findstr( 'ERROR', cmdout ) ) ~= [ 0, 0 ] )
    disp(cmdout);
    fprintf(2,['Erors were encountered\n']);
    return;
else
    [ result ] = tsgReadMatrix( rFile );
end


end

