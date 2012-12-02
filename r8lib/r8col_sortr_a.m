function a = r8col_sortr_a ( m, n, a, key )

%*****************************************************************************80
%
%% R8COL_SORTR_A ascending sorts one column of an R8COL, adjusting all entries.
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
%    Input, integer M, N, the number of rows and columns.
%
%    Input, real A(M,N), an unsorted M by N array.
%
%    Input, integer KEY, the column in which the "key" value
%    is stored.  On output, column KEY of the array will be
%    in nondecreasing order.
%
%    Output, real A(M,N), rows of the array have been shifted in such
%    a way that column KEY of the array is in nondecreasing order.
%
  if ( m <= 0 )
    return
  end

  if ( key < 1 || n < key )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8COL_SORTR_A - Fatal error!\n' );
    fprintf ( 1, '  The value of KEY is not a legal column index.\n' );
    fprintf ( 1, '  KEY = %d\n', key );
    fprintf ( 1, '  N = %d\n', n );
    error ( 'R8COL_SORTR_A - Fatal error!' );
  end
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

      a = r8row_swap ( m, n, a, i, j );
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      if ( a(i,key) < a(j,key) )
        isgn = -1;
      else
        isgn = +1;
      end

    elseif ( indx == 0 )

      break

    end

  end

  return
end
