function toeplitz_cholesky_test ( )

%*****************************************************************************80
%
%% TOEPLITZ_CHOLESKY_TEST tests TOEPLITZ_CHOLESKY.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 November 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOEPLITZ_CHOLESKY_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TOEPLITZ_CHOLESKY library.\n' );

  toeplitz_cholesky_test01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOEPLITZ_CHOLESKY_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

