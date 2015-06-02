function r = r8pbu_resid ( m, n, mu, a, x, b )

%*****************************************************************************80
%
%% R8PBU_RESID computes the residual R = B-A*X for R8PBU matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Input, integer MU, the number of superdiagonals in the matrix.
%    MU must be at least 0 and no more than N-1.
%
%    Input, real A(MU+1,N), the matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Input, real B(M), the desired result A * x.
%
%    Output, real R(M), the residual R = B - A * X.
%
  r = r8pbu_mv ( m, n, mu, a, x );

  r(1:m) = b(1:m) - r(1:m);

  return
end
