function sfc_pres_temp_wr ( )

%*****************************************************************************80
%
%% SFC_PRES_TEMP_WR writes pressure and temperature arrays to a NETCDF file.
%
%  Discussion:
%
%    We are writing 2D data, 6 x 12 lat-lon grids for pressure and temperature.
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
  fprintf ( 1, 'SFC_PRES_TEMP_WR:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Create 2D arrays of pressure and temperature,\n' );
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

  for lat = 1 : lat_num
    for lon = 1 : lon_num
      press_out(lon,lat) = sample_pressure + ( lon - 1 ) * lat_num + ( lat - 1 );
      temp_out(lon,lat) = sample_temp + + 0.25 * ( ( lon - 1 ) * lat_num + ( lat - 1 ) );
    end
  end
%
%  Create the NETCDF file.
%
  nc_filename = 'sfc_pres_temp.nc';

  ncid = netcdf.create ( nc_filename, 'NC_CLOBBER' );
%
%  Define the dimensions.
%
  lat_name = 'latitude';
  lat_dimid = netcdf.defDim ( ncid, lat_name, lat_num );

  lon_name = 'longitude';
  lon_dimid = netcdf.defDim ( ncid, lon_name, lon_num );
%
%  Define the coordinate variables.
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
%  Define the NETCDF variables. The dimids array is used to pass the
%  dimids of the dimensions of the NETCDF variables.
%
  dimids = [ lon_dimid, lat_dimid ];
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
%  Write the coordinate variable data.
%
  netcdf.putVar ( ncid, lat_varid, lats );
  netcdf.putVar ( ncid, lon_varid, lons );
%
%  Write the data.
%
  netcdf.putVar ( ncid, press_varid, press_out );
  netcdf.putVar ( ncid, temp_varid, temp_out );
%
%  Close the file.
%
  netcdf.close ( ncid );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', nc_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SFC_PRES_TEMP_WR:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
