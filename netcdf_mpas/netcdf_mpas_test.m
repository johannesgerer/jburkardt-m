function netcdf_mpas_test ( )

%*****************************************************************************80
%
%% NETCDF_MPAS_TEST tests some routines for reading MPAS NETCDF files.
%
%  Discussion:
%
%    These examples work with a particular pre-exisiting file called
%    'x1.2562.grid.nc' which describes a mesh of points on the
%    surface of the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 December 2010
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NETCDF_MPAS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NETCDF_MPAS library.\n' );

  filename = 'x1.642.grid.nc';

  netcdf_mpas_test01 ( filename );

  netcdf_mpas_test02 ( filename );

  netcdf_mpas_test03 ( filename );

  netcdf_mpas_test04 ( filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NETCDF_MPAS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n'  );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
