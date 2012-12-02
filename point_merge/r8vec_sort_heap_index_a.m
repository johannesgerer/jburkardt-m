function indx = r8vec_sort_heap_index_a ( n, a )

%*****************************************************************************80
%
%% R8VEC_SORT_HEAP_INDEX_A does an indexed heap ascending sort of an R8VEC.
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
%    or explicitly, by the call
%
%      call R8VEC_PERMUTE ( N, A, INDX )
%
%    after which A(I), I = 1 to N is sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(N), an array to be index-sorted.
%
%    Output, integer INDX(N), the sort index.  The
%    I-th element of the sorted array is A(INDX(I)).
%
  if ( n < 1 )
    indx = [];
    return;
  end

  indx(1:n) = 1:n;

  if ( n == 1 )
    return;
  end

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
        break;
      end

    end

    i = l;
    j = l + l;

    while ( j <= ir )

      if ( j < ir )
        if ( a(indx(j)) < a(indx(j+1)) )
          j = j + 1;
        end
      end

      if ( aval < a(indx(j)) )
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
