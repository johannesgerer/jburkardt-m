function [ a, n, icol ] = r8col_insert ( m, n, a, x )

%*****************************************************************************80
%
%% R8COL_INSERT inserts a column into an R8COL.
%
%  Example:
%
%    Input:
%
%      MAXCOL = 10,
%      M = 3,
%      N = 4,
%
%      A = (
%        1.  2.  3.  4.
%        5.  6.  7.  8.
%        9. 10. 11. 12. )
%
%      X = ( 3., 4., 18. )
%
%    Output:
%
%      N = 5,
%
%      A = (
%        1.  2.  3.  3.  4.
%        5.  6.  4.  7.  8.
%        9. 10. 18. 11. 12. )
%
%      ICOL = 3
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, real A(M,N), a table of numbers, regarded
%    as an array of columns.  The columns must have been sorted
%    lexicographically.
%
%    Input, real X(M), a vector of data which will be inserted
%    into the table if it does not already occur.
%
%    Output, real A(M,N), the modified array.
%
%    Output, integer N, the number of columns, which will have increased by
%    1 if X had to be inserted.
%
%    Output, integer ICOL.
%    I, X was inserted into column I.
%    -I, column I was already equal to X.
%

%
%  Stick X temporarily in column N+1, just so it's easy to use R8COL_COMPARE.
%
  a(1:m,n+1) = x(1:m)';
%
%  Do a binary search.
%
  low = 1;
  high = n;

  while ( 1 )

    if ( high < low )
      icol = low;
      break
    end

    mid = round ( ( low + high ) / 2 );

    isgn = r8col_compare ( m, n+1, a, mid, n+1 );

    if ( isgn == 0 )
      icol = -mid;
      return
    elseif ( isgn == -1 )
      low = mid + 1;
    elseif ( isgn == +1 )
      high = mid - 1;
    end

  end
%
%  Shift part of the table up to make room.
%
  for j = n : -1 : icol
    a(1:m,j+1) = a(1:m,j);
  end
%
%  Insert the new column.
%
  a(1:m,icol) = x(1:m)';

  n = n + 1;

  return
end
