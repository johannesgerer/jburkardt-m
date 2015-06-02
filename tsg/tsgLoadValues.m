function tsgLoadValues( lGrid, values )
%
% tsgLoadValues( lGrid, values )
%
% Takes the values of the fuction to be interpolated evalueated at the grid
% points and loads them into the grid. 
%
% INPUT:
%
% lGrid: a grid list created by tsgMakeGrid(...)
%
% values: an array of size [ num_new_points, outputs ]
%         contains the values of the interpolated function at the
%         quadrature points
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

sCommand = [sTasGrid,' -loadvalues'];

sCommand = [ sCommand, ' -gridfile ', gFile];

tsgWriteMatrix( vFile, values );

sCommand = [ sCommand, ' -if ', vFile];

[status, cmdout] = system(sCommand);

if ( size( findstr( 'ERROR', cmdout ) ) ~= [ 0, 0 ] )
    disp(cmdout);
    fprintf(2,['Erors were encountered\n']);
    return;
end

end
