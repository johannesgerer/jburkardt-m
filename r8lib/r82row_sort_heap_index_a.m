function indx = r82row_sort_heap_index_a ( n, a )

%*****************************************************************************80
%
%% R82ROW_SORT_HEAP_INDEX_A does an indexed heap ascending sort of an R82ROW.
%
%  Discussion:
%
%    An R82ROW is a (2,N) array of R8's.
%
%    The sorting is not actually carried out.  Rather an index array is
%    created which defines the sorting.  This array may be used to sort
%    or index the array, or to sort or index related arrays keyed on the
%    original array.
%
%    Once the index array is computed, the sorting can be carried out
%    "implicitly:
%
%      A(1:2,INDX(I)), I = 1 to N is sorted,
%
%    or explicitly, by the call
%
%      A = R82ROW_PERMUTE ( N, A, INDX )
%
%    after which A(1:2,I), I = 1 to N is sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(2,N), an array to be index-sorted.
%
%    Output, integer INDX(N), the sort index.  The
%    I-th element of the sorted array is A(1:2,INDX(I)).
%
  if ( n < 1 )
    return
  end

  if ( n == 1 )
    indx(1) = 1;
    return
  end

  indx = i4vec_indicator1 ( n );

  l = floor ( n / 2 ) + 1;
  ir = n;

  while ( 1 )

    if ( 1 < l )

      l = l - 1;
      indxt = indx(l);
      aval(1:2) = a(1:2,indxt);

    else

      indxt = indx(ir);
      aval(1:2) = a(1:2,indxt);
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
        if (   a(1,indx(j)) <  a(1,indx(j+1)) || ...
             ( a(1,indx(j)) == a(1,indx(j+1)) && ...
               a(2,indx(j)) <  a(2,indx(j+1)) ) )
          j = j + 1;
        end
      end

      if (   aval(1) <  a(1,indx(j)) || ...
           ( aval(1) == a(1,indx(j)) && ...
             aval(2) <  a(2,indx(j)) ) )
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

