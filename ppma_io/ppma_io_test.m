function ppma_io_test ( )

%*****************************************************************************80
%
%% PPMA_IO_TEST tests the PPMA_IO library.
%
%  Purpose:
%
%    PPMA_IO_TEST calls the PPMA_IO sample tests.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 May 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PPMA_IO_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PPMA_IO library.\n' );

  ppma_io_test01 ( );
  ppma_io_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PPMA_IO_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

