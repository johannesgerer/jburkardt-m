function isgn = i4row_compare ( m, n, a, i, j )

%*****************************************************************************80
%
%% I4ROW_COMPARE compares two rows of an I4ROW.
%
%  Example:
%
%    Input:
%
%    M = 3, N = 4, I = 2, J = 3
%
%    A = (
%      1  2  3  4
%      5  6  7  8
%      9 10 11 12 )
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
%    Input, integer A(M,N), an array of M rows of vectors of length N.
%
%    Input, integer I, J, the rows to be compared.
%    I and J must be between 1 and M.
%
%    Output, integer ISGN, the results of the comparison:
%    -1, row I < row J,
%     0, row I = row J,
%    +1, row J < row I.
%

%
%  Check that I and J are legal.
%
  if ( i < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4ROW_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Row index I is less than 1.\n' );
    fprintf ( 1, '  I = %d\n', i );
    error ( 'I4ROW_COMPARE - Fatal error!' );
  elseif ( m < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4ROW_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Row index I is out of bounds.\n' );
    fprintf ( 1, '  I = %d\n', i );
    fprintf ( 1, '  Maximum legal value is M = %d\n', m );
    error ( 'I4ROW_COMPARE - Fatal error!' );
  end

  if ( j < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4ROW_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Row index J is less than 1.\n' );
    fprintf ( 1, '  J = %d\n', j );
    error ( 'I4ROW_COMPARE - Fatal error!' );
  elseif ( m < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4ROW_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Row index J is out of bounds.\n' );
    fprintf ( 1, '  J = %d\n', j );
    fprintf ( 1, '  Maximum legal value is M = %d\n', m );
    error ( 'I4ROW_COMPARE - Fatal error!' );
  end

  isgn = 0;

  if ( i == j )
    return
  end

  k = 1;

  while ( k <= n )

    if ( a(i,k) < a(j,k) )
      isgn = -1;
      return
    elseif ( a(j,k) < a(i,k) )
      isgn = +1;
      return
    end

    k = k + 1;

  end

  return
end
