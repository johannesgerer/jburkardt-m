function sfc_pres_temp_rd ( )

%*****************************************************************************80
%
%% SFC_PRES_TEMP_RD reads pressure and temperature arrays from a NETCDF file.
%
%  Discussion:
%
%    We are reading 2D data, 6 x 12 lat-lon grids for pressure and temperature.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 December 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Russ Rew, Glenn Davis, Steve Emmerson, Harvey Davies, Ed Hartne,
%    The NETCDF User's Guide,
%    Unidata Program Center, March 2009.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SFC_PRES_TEMP_RD:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read 2D arrays of pressure and temperature\n' );
  fprintf ( 1, '  from a NETCDF file.\n' );
%
%  Open the file.
%
  nc_filename = 'sfc_pres_temp.nc';
  ncid = netcdf.open ( nc_filename, 'NOWRITE' );
%
%  There are a number of inquiry functions in NETCDF which can be
%  used to learn about an unknown NETCDF file.  INQ tells how many
%  NETCDF variables, dimensions, and global attributes are in the
%  file; also the dimension id of the unlimited dimension, if there
%  is one.
%
  [ ndims_in, nvars_in, ngatts_in, unlimdimid_in ] = netcdf.inq ( ncid );
%
%  In this case, we know that there are:
%    2 NETCDF dimensions,
%    4 NETCDF variables,
%    0 global attributes,
%    the unlimited dimension id is -1 (because there is no unlimited dimension).
%
  if ( ndims_in ~= 2 | ...
       nvars_in ~= 4 | ...
       ngatts_in ~= 0 | ...
       unlimdimid_in ~= -1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
    fprintf ( 1, '  File has wrong properties.\n' );
    return
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The file properties are correct.\n' );
%
%  Get the varids of the latitude and longitude coordinate variables.
%
  lat_name = 'latitude';
  lat_varid = netcdf.inqVarid ( ncid, lat_name );

  lon_name = 'longitude';
  lon_varid = netcdf.inqVarid ( ncid, lon_name );
%
%  Read the latitude and longitude data.
%
  lats = netcdf.getVar ( ncid, lat_varid );
  lons = netcdf.getVar ( ncid, lon_varid );
%
%  Check to make sure we got what we expected.
%
  lat_num = 6;
  lat_start = 25.0;

  for lat = 1 : lat_num
    if (lats(lat) ~= lat_start + ( lat - 1 ) * 5.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
      fprintf ( 1, '  LAT data is wrong.\n' );
    end
  end
  fprintf ( 1, '  The LAT data is correct.\n' );

  lon_num = 12;
  lon_start = -125.0;

  for lon = 1 : lon_num
    if (lons(lon) ~= lon_start + ( lon - 1 ) * 5.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
      fprintf ( 1, '  LON data is wrong.\n' );
    end
  end
  fprintf ( 1, '  The LON data is correct.\n' );
%
%  Get the varids of the pressure and temperature variables.
%
  press_name = 'pressure';
  press_varid = netcdf.inqVarid ( ncid, press_name );
  temp_name = 'temperature';
  temp_varid = netcdf.inqVarid ( ncid, temp_name );
%
%  Read the pressure and temperature data.
%
  press = netcdf.getVar ( ncid, press_varid );
  temp = netcdf.getVar ( ncid, temp_varid );
%
%  Check the data. It should be the same as the data we wrote.
%
  sample_pressure = 900.0;
  sample_temp = 9.0;

  for lon = 1 : lon_num
    for lat = 1 : lat_num

      if ( press(lon,lat) ~= sample_pressure + ( lon - 1 ) * lat_num + ( lat - 1 ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
        fprintf ( 1, '  PRESS data is wrong.\n' );
      end

      if ( temp(lon,lat) ~= sample_temp + 0.25 * ( ( lon - 1 ) * lat_num + ( lat - 1 ) ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
        fprintf ( 1, '  TEMP data is wrong.\n' );
      end

    end
  end

  fprintf ( 1, '  The PRESS data is correct.\n' );
  fprintf ( 1, '  The TEMP data is correct.\n' );
%
%  Each of the NETCDF variables has a "units" attribute.
%  Let's read them and check them.
%
  units = 'units';

  lat_units = netcdf.getAtt ( ncid, lat_varid, units );
  if ( lat_units ~= 'degrees north' )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
    fprintf ( 1, '  LAT units is wrong.\n' );
  end

  lon_units = netcdf.getAtt ( ncid, lon_varid, units );
  if ( lon_units ~= 'degrees east' )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
    fprintf ( 1, '  LON units is wrong.\n' );
  end

  press_units = netcdf.getAtt ( ncid, press_varid, units );
  if ( press_units ~= 'hPa' )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
    fprintf ( 1, '  PRESS units is wrong.\n' );
  end

  temp_units = netcdf.getAtt ( ncid, temp_varid, units );
  if ( temp_units ~= 'celsius' )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SFC_PRES_TEMP_RD - Fatal error!\n' );
    fprintf ( 1, '  TEMP units is wrong.\n' );
  end

  fprintf ( 1, '  The units data is correct.\n' );
%
%  Close the file.
%
  netcdf.close ( ncid );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was read from the file "%s".\n', nc_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SFC_PRES_TEMP_RD:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end