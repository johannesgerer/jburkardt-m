function [ m, n, nst, ist, jst, ast ] = st_transpose ( m, n, nst, ist, jst, ...
  ast )

%*****************************************************************************80
%
%% ST_TRANSPOSE transposes an ST matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer M, the number of row.
%
%    Input/output, integer N, the number of columns.
%
%    Input/output, integer NST, the number of nonzeros.
%
%    Input/output, integer IST(NST), JST(NST), the row and column indices.
%
%    Input/output, real AST(NST), the nonzero values.
%
  t = m;
  m = n;
  n = t;

  t          = ist(1:nst);
  ist(1:nst) = jst(1:nst);
  jst(1:nst) = t(1:nst);

  return
end
