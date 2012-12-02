function a = i4row_sort_a ( m, n, a )

%*****************************************************************************80
%
%% I4ROW_SORT_A ascending sorts the rows of an I4ROW.
%
%  Discussion:
%
%    In lexicographic order, the statement "X < Y", applied to two
%    vectors X and Y of length M, means that there is some index I, with
%    1 <= I <= M, with the property that
%
%      X(J) = Y(J) for J < I,
%    and
%      X(I) < Y(I).
%
%    In other words, X is less than Y if, at the first index where they
%    differ, the X value is less than the Y value.
%
%  Example:
%
%    Input:
%
%      M = 5, N = 3
%
%      A =
%        3  2  1
%        2  4  3
%        3  1  8
%        2  4  2
%        1  9  9
%
%    Output:
%
%      A =
%        1  9  9
%        2  4  2
%        2  4  3
%        3  1  8
%        3  2  1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A.
%
%    Input, integer N, the number of columns of A.
%
%    Input, integer A(M,N), the array of M rows of N-vectors.
%
%    Output, integer A(M,N), the rows of A have been sorted in ascending
%    lexicographic order.
%

%
%  Initialize.
%
  i = 0;
  indx = 0;
  isgn = 0;
  j = 0;
%
%  Call the external heap sorter.
%
  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( m, indx, isgn );
%
%  Interchange the I and J objects.
%
    if ( 0 < indx )

      a = i4row_swap ( m, n, a, i, j );
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      isgn = i4row_compare ( m, n, a, i, j );

    elseif ( indx == 0 )

      break

    end

  end

  return
end
