function pres_temp_4D_wr ( )

%*****************************************************************************80
%
%% PRES_TEMP_4D_WR writes a 4 dimensional array to a NETCDF file.
%
%  Discussion:
%
%    We are writing 4D data, a 2 x 6 x 12 lvl-lat-lon grid,
%    with 2 timesteps of data.
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
%    The NetCDF User's Guide,
%    Unidata Program Center, March 2009.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRES_TEMP_4D_WR:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Create two 4D arrays of pressure and temperature,\n' );
  fprintf ( 1, '  and write them to a NETCDF file.\n' );
%
%  Create the data.
%
  lat_num = 6;
  lat_start = 25.0;

  for lat = 1 : lat_num
    lats(lat) = lat_start + ( lat - 1 ) * 5.0;
  end

  lon_num = 12;
  lon_start = -125.0;

  for lon = 1 : lon_num
    lons(lon) = lon_start + ( lon - 1 ) * 5.0;
  end

  sample_pressure = 900.0;
  sample_temp = 9.0;

  lvl_num = 2;
  i = 0;
  for lvl = 1 : lvl_num
    for lat = 1 : lat_num
      for lon = 1 : lon_num
        press_out(lon,lat,lvl) = sample_pressure + i;
        temp_out(lon,lat,lvl) = sample_temp + i;
        i = i + 1;
      end
    end
  end
%
%  Create the NETCDF file.
%
  nc_filename = 'pres_temp_4D.nc';

  ncid = netcdf.create ( nc_filename, 'NC_CLOBBER' );
%
%  Define the dimensions.  The record dimension is defined to have
%  unlimited length - it can grow as needed. In this example it is
%  the time dimension.
%
  lvl_name = 'level';
  lvl_dimid = netcdf.defDim ( ncid, lvl_name, lvl_num );

  lat_name = 'latitude';
  lat_dimid = netcdf.defDim ( ncid, lat_name, lat_num );

  lon_name = 'longitude';
  lon_dimid = netcdf.defDim ( ncid, lon_name, lon_num );

  rec_name = 'time';
  rec_dimid = netcdf.defDim ( ncid, rec_name, netcdf.getConstant ( 'NC_UNLIMITED' ) );
%
%  Define the coordinate variables.  We will only define coordinate
%  variables for lat and lon.  Ordinarily we would need to provide
%  an array of dimension IDs for each variable's dimensions, but
%  since coordinate variables only have one dimension, we can
%  simply provide the address of that dimension ID (lat_dimid) and
%  similarly for (lon_dimid).
%
  lat_varid = netcdf.defVar ( ncid, lat_name, 'double', lat_dimid );
  lon_varid = netcdf.defVar ( ncid, lon_name, 'double', lon_dimid );
%
%  Assign units attributes to coordinate variables.
%
  units = 'units';
  lat_units = 'degrees north';
  netcdf.putAtt ( ncid, lat_varid, units, lat_units );
  lon_units = 'degrees east';
  netcdf.putAtt ( ncid, lon_varid, units, lon_units );
%
%  The dimids array is used to pass the dimids of the dimensions of
%  the NETCDF variables. Both of the NETCDF variables we are creating
%  share the same four dimensions.
%
  dimids = [ lon_dimid, lat_dimid, lvl_dimid, rec_dimid ];
%
%  Define the NETCDF variables for the pressure and temperature data.
%
  press_name = 'pressure';
  press_varid = netcdf.defVar ( ncid, press_name, 'double', dimids );
  temp_name = 'temperature';
  temp_varid = netcdf.defVar ( ncid, temp_name, 'double', dimids );
%
%  Assign units attributes to the variables.
%
  press_units = 'hPa';
  netcdf.putAtt ( ncid, press_varid, units, press_units );
  temp_units = 'celsius';
  netcdf.putAtt ( ncid, temp_varid, units, temp_units );
%
%  End define mode.
%
  netcdf.endDef ( ncid );
%
%  Write the coordinate variable data.  This will put the latitudes
%  and longitudes of our data grid into the NETCDF file.
%
  netcdf.putVar ( ncid, lat_varid, lats );
  netcdf.putVar ( ncid, lon_varid, lons );
%
%  These settings tell NETCDF to write one timestep of data.  The
%  setting of start(4) inside the loop below tells NETCDF which
%  timestep to write.
%
%  Apparently, START must be set using the C convention, that is,
%  it seems to be zero-based!
%
  count = [ lon_num, lat_num, lvl_num, 1 ];
  start = [ 0, 0, 0, 0 ];
%
%  Write the data.  This will write our surface pressure and
%  surface temperature data.  The arrays only hold one timestep worth
%  of data.  We will just rewrite the same data for each timestep.  In
%  a real application, the data would change between timesteps.
%
  rec_num = 2;

  for rec = 1 : rec_num

    start(4) = rec - 1;
    netcdf.putVar ( ncid, press_varid, start, count, press_out );
    netcdf.putVar ( ncid, temp_varid, start, count, temp_out );

  end
%
%  Close the file.
%
  netcdf.close ( ncid );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', nc_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRES_TEMP_4D_WR:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
