function fem_io_test ( )

%*****************************************************************************80
%
%% FEM_IO_TEST runs the FEM_IO tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2006
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_IO_TEST\n' );
  fprintf ( 1, '  Test the FEM_IO library.\n' );

  fem_io_test01 ( );
  fem_io_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
