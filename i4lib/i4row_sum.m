function rsum = i4row_sum ( m, n, a )

%*****************************************************************************80
%
%% I4ROW_SUM returns the sums of the rows of an I4ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), an array of data.
%
%    Output, integer RSUM(M), the sum of the entries of each row of TABLE.
%
  for i = 1 : m
    rsum(i) = sum ( a(i,1:n) );
  end

  return
end
