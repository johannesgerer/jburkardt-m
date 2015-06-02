function stla_io_test ( )

%*****************************************************************************80
%
%% STLA_IO_TEST tests the STLA_IO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STLA_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the STLA_IO library.\n' );

  stla_io_test01 ( 'cube.stla' );
  stla_io_test02 ( 'cube.stla' );
  stla_io_test03 ( 'cube.stla' );
  stla_io_test04 ( 'cube_new.stla' );
  stla_io_test05;
  stla_io_test06;
  
  stla_io_test07 ( 'cube.stla' );
  stla_io_test07 ( 'sphere.stla' );
  stla_io_test07 ( 'teapot.stla' );
  
  stla_io_test08 ( 'sphere.stla' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'STLA_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
