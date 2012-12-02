function row_sum = r8row_sum ( m, n, a )

%*****************************************************************************80
%
%% R8ROW_SUM returns the sums of an R8ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the R8ROW
%
%    Output, real ROW_SUM(M), the sum of the entries of 
%    each row.
%
  for i = 1 : m
    row_sum(i) = sum ( a(i,1:n) );
  end

  return
end
