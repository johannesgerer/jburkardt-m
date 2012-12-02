function a = i4col_sort2_a ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORT2_A ascending sorts the elements of each column of an I4COL.
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
%    Input, integer M, the number of rows of A.
%
%    Input, integer N, the number of columns of A, and the length
%    of a vector of data.
%
%    Input, integer A(M,N), the array of N columns of M vectors.
%
%    Output, integer A(M,N), the elements of each column of A have been 
%    sorted in ascending order.
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
  for col = 1 : n

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

        [ a(i,col), a(j,col) ] = i4_swap ( a(i,col), a(j,col) );
%
%  Compare the I and J objects.
%
      elseif ( indx < 0 )

        if ( a(j,col) < a(i,col) )
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
