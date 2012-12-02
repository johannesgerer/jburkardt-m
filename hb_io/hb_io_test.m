function hb_io ( )

%*****************************************************************************80
%
%% HB_IO_TEST runs the HB_IO tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 July 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HB_IO library.\n' );

  hb_io_test01 ( 'rua_32.txt' );
  hb_io_test01 ( 'rse_5.txt' );
  hb_io_test02 ( );
  hb_io_test03 ( 'rua_32.txt' );
  hb_io_test03 ( 'rse_5.txt' );
  hb_io_test04 ( );
  hb_io_test05 ( 'rua_32.txt' );
  hb_io_test05 ( 'rse_5.txt' );
  hb_io_test06 ( );
  hb_io_test07 ( 'rua_32.txt' );
  hb_io_test08 ( );
  hb_io_test09 ( 'rua_32.txt' );
  hb_io_test10 ( );
  hb_io_test11 ( );
  hb_io_test12 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HB_IO_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
