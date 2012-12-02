function icol = r8col_find ( m, n, a, x )

%*****************************************************************************80
%
%% R8COL_FIND seeks a column value in an R8COL.
%
%  Example:
%
%    Input:
%
%      M = 3,
%      N = 4,
%
%      A = (
%        1.  2.  3.  4.
%        5.  6.  7.  8.
%        9. 10. 11. 12. )
%
%      x = ( 3.,
%            7.,
%           11. )
%
%    Output:
%
%      ICOL = 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), a table of numbers, regarded as
%    N columns of vectors of length M.
%
%    Input, real X(M), a vector to be matched with a column of A.
%
%    Output, integer ICOL, the index of the first column of A
%    which exactly matches every entry of X, or -1 if no match
%    could be found.
%
  icol = -1;

  for j = 1 : n

    if ( x(1:m) == a(1:m,j)' )
      icol = j;
      return
    end

  end

  return
end
