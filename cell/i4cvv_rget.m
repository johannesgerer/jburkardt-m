function ai = i4cvv_rget ( mn, a, m, roff, i )

%*****************************************************************************80
%
%% I4CVV_RGET gets row I from an I4CVV.
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
%    Input, integer I, the row.
%    1 <= I <= M.
%
%    Output, integer AI(NR(I)), the value of A(I,*).
%
  k1 = roff(i) + 1;
  k2 = roff(i+1);
  nv = k2 + 1 - k1;
  ai(1:nv) = a(k1:k2);

  return
end
