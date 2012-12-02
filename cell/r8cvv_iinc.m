function a = r8cvv_iinc ( mn, a, m, roff, i, j, daij )

%*****************************************************************************80
%
%% R8CVV_IINC increments item J from row I in an R8CVV.
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
%    Input, integer I, the row of the item.
%    1 <= I <= M.
%
%    Input, integer J, the column of the item.
%    1 <= J <= NR(I).
%
%    Input, real DAIJ, the increment to the value of item A(I,J).
%
%    Uutput, real A(MN), the updated cell array.
%
  k = roff(i) + j;
  a(k) = a(k) + daij;

  return
end
