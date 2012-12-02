function indx = r8vec2_sort_heap_index_a ( n, x, y )

%*****************************************************************************80
%
%% R8VEC2_SORT_HEAP_INDEX_A does an indexed heap ascending sort of an R8VEC2.
%
%  Discussion:
%
%    An R8VEC2 is two R8VEC's.
%
%    An R8VEC is a vector of R8 values.
%
%    The sorting is not actually carried out.  Rather an index array is
%    created which defines the sorting.  This array may be used to sort
%    or index the array, or to sort or index related arrays keyed on the
%    original array.
%
%    ( X(I), Y(I) ) < ( X(J), Y(J) ) if:
%
%    * X(I) < X(J), or
%
%    * X(I) = X(J), and Y(I) < Y(J).
%
%    Once the index array is computed, the sorting can be carried out
%    "implicitly:
%
%      ( X(INDX(1:N)), Y(INDX(1:N) ), is sorted,
%
%    or explicitly, by the call
%
%      call dvec_permute ( n, x, indx )
%      call dvec_permute ( n, y, indx )
%
%    after which ( X(1:N), Y(1:N) ), is sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real X(N),Y(N), pairs of X, Y coordinates of points.
%
%    Output, integer INDX(N), the sort index.  The
%    I-th element of the sorted array has coordinates ( X(INDX(I)), Y(INDX(I) ).
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
      xval = x(indxt);
      yval = y(indxt);

    else

      indxt = indx(ir);
      xval = x(indxt);
      yval = y(indxt);
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

        if ( x(indx(j)) < x(indx(j+1)) || ...
          ( x(indx(j)) == x(indx(j+1)) && y(indx(j)) < y(indx(j+1)) ) )
          j = j + 1;
        end

      end

      if ( xval < x(indx(j)) || ...
          ( xval == x(indx(j)) && yval < y(indx(j)) ) )
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

