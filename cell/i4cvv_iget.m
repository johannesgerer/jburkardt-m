function aij = i4cvv_iget ( mn, a, m, roff, i, j )

%*****************************************************************************80
%
%% I4CVV_IGET gets item J from row I in an I4CVV.
%
%  Discussion:
%
%    An I4CVV is a "vector of vectors" of I4's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MN, the size of the cell array.
%
%    Input, integer A(MN), the cell array.
%
%    Input, integer M, the number of rows in the array.
%
%    Input, integer ROFF(M+1), the row offsets.
%
%    Input, integer I, the row of the item.
%    1 <= I <= M.
%
%    Input, integer J, the column of the item.
%    1 <= J <= NR(I).
%
%    Output, integer AIJ, the value of item A(I,J).
%
  k = roff(i) + j;
  aij = a(k);

  return
end
