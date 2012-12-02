function read_woa01(file,variable)

%*****************************************************************************80
%
%% READ_WOA01 ?
%
%  Discussion:
%
%    This function is discussed in chapter 13 of the reference.
%
%  Modified:
%
%    01 December 2009
%
%  Author:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers.
%
%  Reference:
%
%    Benoit Cushman-Roisin, Jean-Marie Beckers,
%    Introduction to Geophysical Fluid Dynamics,
%    Academic Press, 2010.
%
%  Parameters:
%

%
% read_woa01('file','variable')
%  'file' is NetCDF file
%  'variable' must be 'all', 'list' or '<var_name>'
%
% read WOA01 Levitus T-S-O2, Stddev & nb_obs Netcdf file in memory

% $Id: read_woa01.m,v 1.3 2005/05/19 12:26:01 jgrelet Exp $

if nargin < 2 
   help(mfilename)
   return
end

filesfound = checkforfiles( file );
if filesfound == 0; 
   error(['Couldn''t find ', file])
end

% a commenter en production
t = cputime;

% il existe un "bug" dans netcdf ligne 409, ncitem retourne une
% erreur dans la variable result
nc = netcdf(which(file),'nowrite');

%recupere les variables et les mets de le workspace
variables = var(nc);

% list les variables du fichier et sort
if strcmp( variable, 'list' )
    disp(char(ncnames(var(nc))));
    return
end

% lit toutes les variables du fichier et les mets dans le workspace
if strcmp( variable, 'all' )
    for i = 1:length(variables)
        value = variables{i}(:);
        % je n'ai pas reussi a utiliser autonan avec l'attribue FillValue_
        value(find(value == fillval(variables{i}))) = NaN;
        % Assign variable in workspace.
        assignin('base', name(variables{i}), value );
    end
else
    value = nc{variable}(:); 
    value(find(value == fillval(nc{variable}))) = NaN;
    % Assign variable in workspace.
    assignin('base', name(nc{variable}), value );
end

close(nc);

% a commenter en production
e = cputime-t

%clear all;

% plot(squeeze(std_temperature(90,90,1:12)),depth(1:12)
% plot(squeeze(temperature(90,90,1:12)),depth(1:12)
% plot(squeeze(temperature(90,90,1:12)),depth(1:12))
% plot(squeeze(temperature(90,90,1:12)),-depth(1:12))
% hold on
% plot(squeeze(temperature(90,90,1:12))+squeeze(std_temperature(90,90,1:12)),-depth(1:12))
% hold on
% plot(squeeze(temperature(90,90,1:12))-squeeze(std_temperature(90,90,1:12)),-depth(1:12))
% plot(squeeze(temperature(90,90,1:12))-squeeze(std_temperature(90,90,1:12)),-depth(1:12),'-k')
% plot(squeeze(temperature(90,90,1:12))+squeeze(std_temperature(90,90,1:12)),-depth(1:12),'-k')
% plot(squeeze(temperature(90,90,1:12))+2*squeeze(std_temperature(90,90,1:12)),-depth(1:12),'-r')
% plot(squeeze(temperature(90,90,1:12))-2*squeeze(std_temperature(90,90,1:12)),-depth(1:12),'-r')

%----------------------------------------------------------------------
%----------------------------------------------------------------------
function filesfound = checkforfiles( file )

if exist(file,'file');
   filesfound = 1;
else 
   filesfound = 0;
end

  return
end
