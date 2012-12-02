function mean = r8row_mean ( m, n, x )

%*****************************************************************************80
%
%% R8ROW_MEAN returns the means of rows of an R8ROW.
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
%    Input, integer M, N, the number of rows and columns in the array.
%
%    Input, real X(M,N), the R8ROW.
%
%    Output, real MEAN(M), the means, or averages,
%    of the rows of X.
%
  for i = 1 : m
    mean(i) = sum ( x(i,1:n) ) / n;
  end

  return
end
