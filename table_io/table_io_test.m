function table_io_test ( )

%*****************************************************************************80
%
%% TABLE_IO_TEST tests the TABLE_IO library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TABLE_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TABLE_IO library.\n' );

  table_io_test01 ( );
  table_io_test02 ( );
  table_io_test03 ( );
  table_io_test04 ( );
  table_io_test05 ( );
  table_io_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TABLE_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end


