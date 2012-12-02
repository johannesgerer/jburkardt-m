function mn = r8cvv_size ( m, nr )

%*****************************************************************************80
%
%% R8CVV_SIZE determines the size of an R8CVV.
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
%    Input, integer M, the number of rows in the array.
%
%    Input, integer NR(M), the size of each row.
%
%    Output, integer MN, the size of the cell array.
%
  mn = sum ( nr(1:m) );

  return
end
