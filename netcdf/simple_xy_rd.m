function simple_xy_rd ( )

%*****************************************************************************80
%
%% SIMPLE_XY_RD reads a 2 dimensional array from a NETCDF file.
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
  fprintf ( 1, 'SIMPLE_XY_RD:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Read a small 2D array from a NETCDF file.\n' );
%
%  Open the file.
%
  nc_filename = 'simple_xy.nc';
  ncid = netcdf.open ( nc_filename, 'NOWRITE' );
%
%  Get the varid of the data based on its name.
%
  varid = netcdf.inqVarID ( ncid, 'data_out' );
%
%  Read the data.
%
  data_out = netcdf.getVar ( ncid, varid );
%
%  Compare the data to the expected value.
%
  nj = 6;
  ni = 12;

  for j = 1 : nj
    for i = 1 : ni
      if ( data_out(i,j) ~= ( j - 1 ) * ni - ( i - 1 ) )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'SIMPLE_XY_RD - Fatal error!\n' );
        fprintf ( 1, '  Entry (%d,%d) of array seems to be wrong.\n', i, j );
      end
    end
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data is correct.\n' );
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
  fprintf ( 1, 'SIMPLE_XY_RD:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
