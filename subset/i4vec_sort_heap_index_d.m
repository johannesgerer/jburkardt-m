function indx = i4vec_sort_heap_index_d ( n, a )

%*****************************************************************************80
%
%% I4VEC_SORT_HEAP_INDEX_D does an indexed heap descending sort of an integer vector.
%
%  Discussion:
%
%    The sorting is not actually carried out.  Rather an index array is
%    created which defines the sorting.  This array may be used to sort
%    or index the array, or to sort or index related arrays keyed on the
%    original array.
%
%    Once the index array is computed, the sorting can be carried out
%    "implicitly:
%
%      A(INDX(I)), I = 1 to N is sorted,
%
%    after which A(I), I = 1 to N is sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, integer A(N), an array to be index-sorted.
%
%    Output, integer INDX(N), contains the sort index.  The
%    I-th element of the sorted array is A(INDX(I)).
%
  indx = i4vec_indicator ( n );

  l = floor ( n / 2 ) + 1;
  ir = n;

  while ( 1 )

    if ( 1 < l )

      l = l - 1;
      indxt = indx(l);
      aval = a(indxt);

    else

      indxt = indx(ir);
      aval = a(indxt);
      indx(ir) = indx(1);
      ir = ir - 1;

      if ( ir == 1 )
        indx(1) = indxt;
        return
      end

    end

    i = l;
    j = l + l;

    while ( j <= ir )

      if ( j < ir )
        if ( a(indx(j+1)) < a(indx(j)) )
          j = j + 1;
        end
      end

      if ( a(indx(j)) < aval )
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
