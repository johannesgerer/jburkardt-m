function r = r8sp_resid ( m, n, nz_num, row, col, a, x, b )

%*****************************************************************************80
%
%% R8SP_RESID computes the residual R = B-A*X for R8SP matrices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 June 2014
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
%    Input, integer NZ_NUM, the number of nonzero elements in
%    the matrix.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and 
%    column indices of the nonzero elements.
%
%    Input, real A(NZ_NUM), the nonzero elements of the matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Input, real B(M), the desired result A * x.
%
%    Output, real R(M), the residual R = B - A * X.
%
  r = r8sp_mv ( m, n, nz_num, row, col, a, x );

  r(1:m,1) = b(1:m,1) - r(1:m,1);

  return
end

