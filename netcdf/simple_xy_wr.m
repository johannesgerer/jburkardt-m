function simple_xy_wr ( )

%*****************************************************************************80
%
%% SIMPLE_XY_WR writes a 2 dimensional array to a NETCDF file.
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
  fprintf ( 1, 'SIMPLE_XY_WR:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Create a small 2D array and write it to a NETCDF file.\n' );
%
%  Specify the number of diimensions, the value of the dimensions,
%  and then fill the array.
%
  ndims = 2;
  nj = 6;
  ni = 12;

  for j = 1 : nj
    for i = 1 : ni
      data_out(i,j) = ( j - 1 ) * ni - ( i - 1 );
    end
  end
%
%  Create the NETCDF file.
%
  nc_filename = 'simple_xy.nc';

  ncid = netcdf.create ( nc_filename, 'NC_CLOBBER' );
%
%  Define the dimensions.
%
  i_dimid = netcdf.defDim ( ncid, 'ni', ni );
  j_dimid = netcdf.defDim ( ncid, 'nj', nj );
%
%  The dimids array is used to pass the IDs of the dimensions of
%  the variables.  Note that in MATLAB arrays are stored in
%  column-major format.
%
  dimids(1) = i_dimid;
  dimids(2) = j_dimid;
%
%  Define the variable. The type of the variable in this case is
%  NF_INT (4-byte integer).
%
  varid = netcdf.defVar ( ncid, 'data_out', 'int', dimids );
%
%  End define mode.
%
  netcdf.endDef ( ncid );
%
%  Write the data to the file.
%
  netcdf.putVar ( ncid, varid, data_out )
%
%  Close the file.
%
  netcdf.close ( ncid )
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to the file "%s".\n', nc_filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLE_XY_WR:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
