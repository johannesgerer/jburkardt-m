function error_frobenius = cholesky_upper_error ( n, a, c )

%*****************************************************************************80
%
%% CHOLESKY_UPPER_ERROR determines the error in an upper Cholesky factor.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the matrix.
%
%    Input, real C(N,N), the upper triangular Cholesky factor.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of the difference matrix A - C' * C.
%
  ctc =  c' * c;

  error_frobenius = norm ( a - ctc, 'fro' );

  return
end