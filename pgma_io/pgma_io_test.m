function pgma_io_test ( )

%*****************************************************************************80
%
%% PGMA_IO_TEST tests the PGMA_IO routines.
%
%  Purpose:
%
%    PGMA_IO_TEST calls the PGMA_IO sample tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 June 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PGMA_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PGMA_IO library.\n' );

  pgma_io_test01 ( );
  pgma_io_test02 ( );
  pgma_io_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PGMA_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

