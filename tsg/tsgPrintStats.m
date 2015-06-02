function tsgPrintStats( lGrid )
%
% tsgPrintStats( lGrid )
%
% shows information about the grid
%
% INPUT:
%
% lGrid: a grid list created by tsgMakeGrid(...)
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[ gFile, qFile, vFile, wFile, pFile, rFile ] = tsgMakeFilenames( lGrid.name );

disp([' ']);
disp(['             MATLAB Report:']);
disp(['                    name:      ',lGrid.name]);
disp(['                     dim:        ',num2str(lGrid.dim)]);
disp(['                     out:        ',num2str(lGrid.out)]);
disp(['                    oned:      ',lGrid.oned]);
disp([' ']);
disp(['             TASMANIAN Report:']);

sCommand = [sTasGrid,' -summary'];
sCommand = [ sCommand, ' -gridfile ', gFile];

[status, cmdout] = system(sCommand);

disp(cmdout);

if ( size( findstr( 'ERROR', cmdout ) ) ~= [ 0, 0 ] )
    fprintf(2,['Erors were encountered\n']);
end

end

