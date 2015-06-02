function b = r83s_mv ( m, n, a, x )

%*****************************************************************************80
%
%% R83S_MV multiplies an R83S matrix times an R8VEC.
%
%  Discussion:
%
%    The R83S storage format is used for a tridiagonal scalar matrix.
%    The vector A(3) contains the subdiagonal, diagonal, and superdiagonal
%    values that occur on every row.
%
%  Example:
%
%    Here is how an R83S matrix of order 5, stored as (A1,A2,A3), would
%    be interpreted:
%
%      A2  A3   0   0   0
%      A1  A2  A3   0   0
%       0  A1  A2  A3   0 
%       0   0  A1  A2  A3
%       0   0   0  A1  A2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(3), the R83S matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(M), the product A * x.
%
  b = zeros ( m, 1 );

  for i = 2 : min ( m, n + 1 )
    b(i) = b(i) + a(1) * x(i-1);
  end

  for i = 1 : min ( m, n )
    b(i) = b(i) + a(2) * x(i);
  end

  for i = 1 : min ( m, n - 1 )
    b(i) = b(i) + a(3) * x(i+1);
  end

  return
end
