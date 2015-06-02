function r83s_print ( n, a, title )

%*****************************************************************************80
%
%% R83S_PRINT prints an R83S matrix.
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
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, real A(3), the R83S matrix.
%
%    Input, string TITLE, a title.
%
  r83s_print_some ( n, a, 1, 1, n, n, title );

  return
end
