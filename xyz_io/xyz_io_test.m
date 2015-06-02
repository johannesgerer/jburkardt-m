function xyz_io_test ( )

%*****************************************************************************80
%
%% XYZ_IO_TEST tests the XYZ_IO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 January 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYZ_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the XYZ_IO library.\n' );

  xyz_io_test01 ( );
  xyz_io_test02 ( );
  xyz_io_test03 ( );
  xyz_io_test04 ( );
  xyz_io_test05 ( );
  xyz_io_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'XYZ_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

