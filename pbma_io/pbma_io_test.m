function pbma_io_test ( )

%*****************************************************************************80
%
%% PBMA_IO_TEST tests the routines in PBMA_IO.
%
%  Purpose:
%
%    PBMA_IO_TEST calls the PBMA_IO sample tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2008
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'PBMA_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PBMA_IO library.\n' );

  pbma_io_test01 ( );
  pbma_io_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PBMA_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

