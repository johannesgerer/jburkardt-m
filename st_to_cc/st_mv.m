function b = st_mv ( m, n, nst, ist, jst, ast, x )

%*****************************************************************************80
%
%% ST_MV multiplies an R8SP matrix by an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    14 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of 
%    the matrix.
%
%    Input, integer NST, the number of nonzero elements in
%    the matrix.
%
%    Input, integer IST(NST), JST(NST), the row and 
%    column indices of the nonzero elements.
%
%    Input, real AST(NST), the nonzero elements of the matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(M), the product vector A*X.
%
  b = zeros ( m, 1 );

  for k = 1 : nst
    i = ist(k);
    j = jst(k);
    b(i) = b(i) + ast(k) * x(j);
  end

  return
end