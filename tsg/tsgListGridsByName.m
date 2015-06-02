function tsgListGridsByName()
%
% tsgListGridsByName()
%
% prints a list of all grids in the WorkFiles folder regardless if they are
% associated with lGrid class
%

[ sFiles, sTasGrid ] = tsgGetPaths();
[status, cmdout] = system(['ls ',sFiles,' | grep gFile_*']);

lines = strread(cmdout,'%s','delimiter','\n');

disp([' Grids in the work folder:']);
disp([' ']);

for i = 1:size(lines,1)
    line = lines{i};
    disp(line(7:end) );
end

disp([' ']);

end

