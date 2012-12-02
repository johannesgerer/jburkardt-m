function vn = r8cvv_nget ( mn, a, m, roff, nn, in, jn )

%*****************************************************************************80
%
%% R8CVV_NGET gets N items JN(*) from row IN(*) in an R8CVV.
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
%    Input, integer NN, the number of items.
%
%    Input, integer IN(NN), the rows of the items.
%    1 <= IN(*) <= M.
%
%    Input, integer JN(NN), the columns of the items.
%    1 <= JN(*) <= NR(IN(*)).
%
%    Output, real VN(NN), the value of items A(IN(*),JN(*)).
%
  k = roff(in(1:nn)) + jn(1:nn);
  vn(1:nn) = a(k);

  return
end
