function a = i4cvv_rinc ( mn, a, m, roff, i, dai )

%*****************************************************************************80
%
%% I4CVV_RINC increments row I in an I4CVV.
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
%    Input, integer DAI(NR(I)), the increment for A(I,*).
%
%    Output, integer A(MN), the cell array.
%
  k1 = roff(i) + 1;
  k2 = roff(i+1);
  nv = k2 + 1 - k1;
  a(k1:k2) = a(k1:k2) + dai(1:nv);

  return
end
