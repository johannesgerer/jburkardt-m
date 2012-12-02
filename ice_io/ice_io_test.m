function ice_io_test ( )

%*****************************************************************************80
%
%% ICE_IO_TEST tests the ICE_IO library.
%
%  Discussion:
%
%    We begin by creating a file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2010
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
  fprintf ( 1, 'ICE_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the ICE_IO library.\n' );
%
%  Create 'hexahexa_2x2x2.nc'
%
  filename = 'hexahexa_2x2x2.nc';
  ice_io_test01 ( @hexahexa_2x2x2, filename );
%
%  Read 'hexahexa_2x2x2.nc'
%
  ice_io_test02 ( filename );
%
%  Create 'cyl248.nc'
%
  filename = 'cyl248.nc';
  ice_io_test01 ( @cyl248, filename );
%
%  Read 'cyl248.nc'
%
  ice_io_test02 ( filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ICE_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n'  );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
