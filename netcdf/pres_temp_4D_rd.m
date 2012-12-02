function pres_temp_4D_rd ( )

%*****************************************************************************80
%
%% PRES_TEMP_4D_RD reads pressure and temperature arrays from a NETCDF file.
%
%  Discussion:
%
%    We are reading 4D data, 2 x 6 x 12 lvl-lat-lon grids for pressure
%    and temperature over 2 time steps.
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
  fprintf ( 1, 'PRES_TEMP_4D_RD:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read 4D arrays of pressure and temperature\n' );
  fprintf ( 1, '  from a NETCDF file.\n' );
%
%  Open the file.
%
  nc_filename = 'pres_temp_4D.nc';
  ncid = netcdf.open ( nc_filename, 'NOWRITE' );
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
      fprintf ( 1, 'PRES_TEMP_4D_RD - Fatal error!\n' );
      fprintf ( 1, '  LAT data is wrong.\n' );
    end
  end
  fprintf ( 1, '\n');
  fprintf ( 1, '  The LAT data is correct.\n' );

  lon_num = 12;
  lon_start = -125.0;

  for lon = 1 : lon_num
    if (lons(lon) ~= lon_start + ( lon - 1 ) * 5.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'PRES_TEMP_4D_RD - Fatal error!\n' );
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
%  Read 1 record of NLVLS*NLATS*NLONS values, starting at the beginning
%  of the record (the (1, 1, 1, rec) element in the NETCDF file).
%
  lvl_num = 2;
  lat_num = 6;
  lon_num = 12;

  count = [ lon_num, lat_num, lvl_num, 1 ];
  start = [ 0, 0, 0, 0 ];
%
%  Read the surface pressure and temperature data from the file, one
%  record at a time.
%
  sample_pressure = 900.0;
  sample_temp = 9.0;

  rec_num = 2;

  for rec = 1 : rec_num

    start(4) = rec - 1;

    press = netcdf.getVar ( ncid, press_varid, start, count );
    temp = netcdf.getVar ( ncid, temp_varid, start, count );

    i = 0;
    for lvl = 1 : lvl_num
      for lat = 1 : lat_num
        for lon = 1 : lon_num
          if ( press(lon,lat,lvl) ~= sample_pressure + i )
            fprintf ( 1, '\n' );
            fprintf ( 1, 'PRES_TEMP_4D_RD - Fatal error!\n' );
            fprintf ( 1, '  PRESS data is wrong.\n' );
          end
          if ( temp(lon,lat,lvl) ~= sample_temp + i )
            fprintf ( 1, '\n' );
            fprintf ( 1, 'PRES_TEMP_4D_RD - Fatal error!\n' );
            fprintf ( 1, '  TEMP data is wrong.\n' );
          end
          i = i + 1;
        end
      end
    end
  end
  fprintf ( 1, '  The PRESS data is correct.\n' );
  fprintf ( 1, '  The TEMP data is correct.\n' );
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
  fprintf ( 1, 'PRES_TEMP_4D_RD:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
