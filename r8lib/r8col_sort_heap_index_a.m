function indx = r8col_sort_heap_index_a ( m, n, a )

%*****************************************************************************80
%
%% R8COL_SORT_HEAP_INDEX_A does an indexed heap ascending sort of an R8COL.
%
%  Discussion:
%
%    The sorting is not actually carried out.  Rather an index array is
%    created which defines the sorting.  This array may be used to sort
%    or index the array, or to sort or index related arrays keyed on the
%    original array.
%
%    A(*,J1) < A(*,J2) if the first nonzero entry of A(*,J1)-A(*,J2) is negative.
%
%    Once the index array is computed, the sorting can be carried out
%    "implicitly:
%
%      A(*,INDX(1:N)) is sorted,
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows in each column of A.
%
%    Input, integer N, the number of columns in A.
%
%    Input, real A(M,N), the array.
%
%    Output, integer INDX(N), the sort index.  The I-th element of the sorted 
%    array is column INDX(I).
%
  if ( n < 1 )
    indx = [];
    return
  end

  indx(1:n) = 1 : n;

  if ( n == 1 )
    return
  end

  l = floor ( n / 2 ) + 1;
  ir = n;

  while ( 1 )

    if ( 1 < l )

      l = l - 1;
      indxt = indx(l);
      column(1:m) = a(1:m,indxt);

    else

      indxt = indx(ir);
      column(1:m) = a(1:m,indxt);
      indx(ir) = indx(1);
      ir = ir - 1;

      if ( ir == 1 )
        indx(1) = indxt;
        break
      end

    end

    i = l;
    j = l + l;

    while ( j <= ir )

      if ( j < ir )

        if ( r8vec_compare ( m, a(1:m,indx(j)), a(1:m,indx(j+1)) ) < 0 )
          j = j + 1;
        end

      end

      if ( r8vec_compare ( m, column, a(1:m,indx(j)) ) < 0 )
        indx(i) = indx(j);
        i = j;
        j = j + j;
      else
        j = ir + 1;
      end

    end

    indx(i) = indxt;

  end

  return
end

