function mn = i4cvv_size ( m, nr )

%*****************************************************************************80
%
%% I4CVV_SIZE determines the size of an I4CVV.
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
%    Input, integer M, the number of rows in the array.
%
%    Input, integer NR(M), the size of each row.
%
%    Output, integer MN, the size of the cell array.
%
  mn = sum ( nr(1:m) );

  return
end
