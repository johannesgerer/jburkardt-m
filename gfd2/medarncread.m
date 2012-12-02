function[a,lon,lat,depth]=medarncread(file)

%*****************************************************************************80
%
%% MEDARNCREAD reads a NETCDF file of A(latitude,longitude,depth).
%
%  Discussion:
%
%    This function is discussed in chapter 11 of the reference.
%
%  Modified:
%
%    03 December 2009
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
  disp(['Reading ' file]);

  nc = netcdf(file, 'nowrite');   % Open NetCDF file.
  disp(nc.description(:))         % Global attribute.
  disp(nc.author(:))              % Global attribute.
  disp(nc.date(:))                % Global attribute.
  variables = var(nc);            % Get variable data.
  lat=variables{1}(:);
  lon=variables{2}(:);
  depth=variables{3}(:);
  a=variables{4}(:);
  nc = close(nc); 

  return
end
