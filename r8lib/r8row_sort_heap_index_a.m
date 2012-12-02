function indx = r8row_sort_heap_index_a ( m, n, a )

%*****************************************************************************80
%
%% R8ROW_SORT_HEAP_INDEX_A does an indexed heap ascending sort of an R8ROW.
%
%  Discussion:
%
%    An R8ROW is an M by N array of R8's, regarded as an array of M rows,
%    each of length N.
%
%    The sorting is not actually carried out.  Rather an index array is
%    created which defines the sorting.  This array may be used to sort
%    or index the array, or to sort or index related arrays keyed on the
%    original array.
%
%    A(I1,*) < A(I1,*) if the first nonzero entry of A(I1,*)-A(I2,*)
%    is negative.
%
%    Once the index array is computed, the sorting can be carried out
%    "implicitly:
%
%      A(INDX(1:M),1:N) is sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 May 2012
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
%    Output, integer INDX(M), the sort index.  The I-th element of the sorted 
%    array is row INDX(I).
%
  indx(1:m) = 1 : m;

  if ( m <= 1 )
    return
  end

  l = floor ( m / 2 ) + 1;
  ir = m;

  while ( 1 )

    if ( 1 < l )

      l = l - 1;
      indxt = indx(l);
      row(1:n) = a(indxt,1:n);

    else

      indxt = indx(ir);
      row(1:n) = a(indxt,1:n);
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

        if ( r8row_compare ( m, n, a, indx(j), indx(j+1) ) < 0 )
          j = j + 1;
        end

      end

      if ( r8vec_compare ( n, row, a(indx(j),1:n) ) < 0 )
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

