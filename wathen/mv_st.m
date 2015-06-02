function b = mv_st ( m, n, nz_num, row, col, a, x )

%*****************************************************************************80
%
%% MV_ST multiplies a sparse triple matrix times a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer NZ_NUM, the number of nonzero values.
%
%    Input, integer ROW(NZ_NUM), COL(NZ_NUM), the row and column indices.
%
%    Input, real A(NZ_NUM), the nonzero values in the M by N matrix.
%
%    Input, real X(N), the vector to be multiplied.
%
%    Output, real B(M), the product A*X.
%
  b = zeros ( m, 1 );

  for k = 1 : nz_num
    b(row(k)) = b(row(k)) + a(k) * x(col(k));
  end

  return
end
