function [ lon, lat, depth ] = etopo5ncread ( )

%*****************************************************************************80
%
%% ETOPO5NCREAD reads the NETCDF file "etopo5.nc".
%
%  Discussion:
%
%    This function is discussed in chapter 7 of the reference.
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
  disp(['Reading etopo5' ]);

  nc = netcdf('../nc/etopo5.nc', 'nowrite');   % Open NetCDF file.
  disp(nc.description(:))         % Global attribute.
  disp(nc.author(:))              % Global attribute.
  disp(nc.date(:))                % Global attribute.
  variables = var(nc);            % Get variable data.
  lat=variables{2}(:);
  lon=variables{1}(:);
  depth=variables{3}(:);
  depth=depth';
  nc = close(nc); 

  return
end
