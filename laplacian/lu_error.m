function error_frobenius = lu_error ( n, a, l, u )

%*****************************************************************************80
%
%% LU_ERROR determines the error in an LU factorization.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2013
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
%    Input, real L(N,N), U(N,N), the LU factors.
%
%    Output, real ERROR_FROBENIUS, the Frobenius norm
%    of the difference matrix A - L * U.
%
  error_frobenius = norm ( a - l * u, 'fro' );

  return
end