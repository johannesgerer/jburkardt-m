function a = r8cvv_rinc ( mn, a, m, roff, i, dai )

%*****************************************************************************80
%
%% R8CVV_RINC increments row I in an R8CVV.
%
%  Discussion:
%
%    An R8CVV is a "vector of vectors" of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MN, the size of the cell array.
%
%    Input, real A(MN), the cell array.
%
%    Input, integer M, the number of rows in the array.
%
%    Input, integer ROFF(M+1), the row offsets.
%
%    Input, integer I, the row.
%    1 <= I <= M.
%
%    Input, real DAI(NR(I)), the increment for A(I,*).
%
%    Output, real A(MN), the cell array.
%
  k1 = roff(i) + 1;
  k2 = roff(i+1);
  nv = k2 + 1 - k1;
  a(k1:k2) = a(k1:k2) + dai(1:nv);

  return
end
