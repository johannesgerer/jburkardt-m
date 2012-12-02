function isgn = r8col_compare ( m, n, a, i, j )

%*****************************************************************************80
%
%% R8COL_COMPARE compares columns in an R8COL.
%
%  Example:
%
%    Input:
%
%      M = 3, N = 4, I = 2, J = 4
%
%      A = (
%        1.  2.  3.  4.
%        5.  6.  7.  8.
%        9. 10. 11. 12. )
%
%    Output:
%
%      ISGN = -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), the M by N array.
%
%    Input, integer I, J, the columns to be compared.
%    I and J must be between 1 and N.
%
%    Output, integer ISGN, the results of the comparison:
%    -1, column I < column J,
%     0, column I = column J,
%    +1, column J < column I.
%

%
%  Check.
%
  if ( i < 1 || n < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index I is out of bounds.\n' );
    error ( 'R8COL_COMPARE - Fatal error!' );
  end

  if ( j < 1 || n < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8COL_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Column index J is out of bounds.\n' );
    error ( 'R8COL_COMPARE - Fatal error!' );
  end

  isgn = 0;

  if ( i == j )
    return
  end

  k = 1;

  while ( k <= m )

    if ( a(k,i) < a(k,j) )
      isgn = -1;
      return
    elseif ( a(k,j) < a(k,i) )
      isgn = +1;
      return
    end

    k = k + 1;

  end

  return
end
