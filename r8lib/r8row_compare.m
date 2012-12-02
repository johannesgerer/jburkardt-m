function value = r8row_compare ( m, n, a, i, j )

%*****************************************************************************80
%
%% R8ROW_COMPARE compares rows in an R8ROW.
%
%  Discussion:
%
%    An R8ROW is an M by N array of R8's, regarded as an array of M rows,
%    each of length N.
%
%  Example:
%
%    Input:
%
%      M = 4, N = 3, I = 2, J = 4
%
%      A = (
%        1  5  9
%        2  6 10
%        3  7 11
%        4  8 12 )
%
%    Output:
%
%      VALUE = -1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 May 2012
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
%    Input, integer I, J, the rows to be compared.
%    I and J must be between 1 and M.
%
%    Output, integer VALUE, the results of the comparison:
%    -1, row I < row J,
%     0, row I = row J,
%    +1, row J < row I.
%

%
%  Check.
%
  if ( i < 1 || m < i )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8ROW_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Row index I is out of bounds.\n' );
    fprintf ( 1, '  I = %d\n', i );
    error ( 'R8ROW_COMPARE - Fatal error!' );
  end

  if ( j < 1 || m < j )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8ROW_COMPARE - Fatal error!\n' );
    fprintf ( 1, '  Row index J is out of bounds.\n' );
    fprintf ( 1, '  J = %d\n', j );
    error ( 'R8ROW_COMPARE - Fatal error!' );
  end

  value = 0;

  if ( i == j )
    return
  end

  k = 1;

  while ( k <= n )

    if ( a(i,k) < a(j,k) )
      value = -1;
      return
    elseif ( a(j,k) < a(i,k) )
      value = +1;
      return
    end

    k = k + 1;

  end

  return
end
