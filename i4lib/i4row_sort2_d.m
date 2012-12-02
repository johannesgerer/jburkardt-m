function a = i4row_sort2_d ( m, n, a )

%*****************************************************************************80
%
%% I4ROW_SORT2_D descending sorts the elements of each row of an I4ROW.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A.
%
%    Input, integer N, the number of columns of A, and the length
%    of a vector of data.
%
%    Input, integer A(M,N), the array of M rows of N-vectors.
%
%    Output, integer A(M,N), the elements of each row of A have been sorted
%    in descending order.
%
  if ( m <= 1 )
    return
  end

  if ( n <= 0 )
    return
  end
%
%  Initialize.
%
  for irow = 1 : m

    i = 0;
    indx = 0;
    isgn = 0;
    j = 0;
%
%  Call the external heap sorter.
%
    while ( 1 )

      [ indx, i, j ] = sort_heap_external ( n, indx, isgn );
%
%  Interchange the I and J objects.
%
      if ( 0 < indx )

        [ a(irow,i), a(irow,j) ] = i4_swap ( a(irow,i), a(irow,j) );
%
%  Compare the I and J objects.
%
      elseif ( indx < 0 )

        if ( a(irow,i) < a(irow,j) )
          isgn = +1;
        else
          isgn = -1;
        end

      elseif ( indx == 0 )

        break

      end

    end

  end

  return
end
