function xy_io_test ( )

%*****************************************************************************80
%
%% XY_IO_TEST tests the XY_IO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 January 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'XY_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the XY_IO library.\n' );

  xy_io_test01 ( );
  xy_io_test02 ( );
  xy_io_test03 ( );
  xy_io_test04 ( );
  xy_io_test05 ( );
  xy_io_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'XY_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

