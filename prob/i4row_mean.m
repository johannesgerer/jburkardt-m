function mean = i4row_mean ( m, n, a )

%*****************************************************************************80
%
%% I4ROW_MEAN returns the means of the rows of an I4ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of data.
%
%    Input, integer A(M,N), the array.
%
%    Output, real MEAN(M), the mean of each row.
%
  for i = 1 : m
    mean(i) = sum ( a(i,1:n) ) / n;
  end

  return
end
