function netcdf_mpas_test01 ( filename )

%*****************************************************************************80
%
%% NETCDF_MPAS_TEST01 reads a file and prints out some information.
%
%  Discussion:
%
%    Read a NETCDF file, making no assumptions about its contents, 
%    and report what you can find out.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string FILENAME, the name of the file to be examined.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NETCDF_MPAS_TEST01\n' );
  fprintf ( 1, '  NETCDF_MPAS_REPORT can read an MPAS NETCDF grid file,\n' );
  fprintf ( 1, '  and print out useful information about what it contains.\n' );

  netcdf_mpas_report ( filename );

  return
end
