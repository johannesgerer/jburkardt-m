function indx = r8vec_sort_heap_mask_a ( n, a, mask_num, mask )

%*****************************************************************************80
%
%% R8VEC_SORT_HEAP_MASK_A: indexed heap ascending sort of a masked R8VEC.
%
%  Discussion:
%
%    An array A is given.  An array MASK of indices into A is given.
%    The routine produces a vector INDX, which is a permutation of the
%    entries of MASK, so that:
%
%      A(MASK(INDX(I)) <= A(MASK(INDX(J))
%
%    whenever
%
%      I <= J
%
%    In other words, only the elements of A that are indexed by MASK
%    are to be considered, and the only thing that happens is that
%    a rearrangment of the indices in MASK is returned that orders the
%    masked elements.
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
%    Input, real A(N), an array to be index-sorted.
%
%    Input, integer MASK_NUM, the number of mask elements.
%
%    Input, integer MASK(MASK_NUM), the mask array.  This is
%    simply a list of indices of A.  The entries of MASK should
%    be unique, and each one should be between 1 and N.
%
%    Output, integer INDX(MASK_NUM), the sort index.  There are MASK_NUM
%    elements of A selected by MASK.  If we want to list those elements
%    in order, then the I-th element is A(MASK(INDX(I))).
%
  if ( n < 1 )
    return
  end

  if ( mask_num < 1 )
    return
  end

  if ( mask_num == 1 )
    indx(1) = 1;
    return
  end

  indx = i4vec_indicator ( mask_num );

  l = floor ( mask_num / 2 ) + 1;
  ir = mask_num;

  while ( 1 )

    if ( 1 < l )

      l = l - 1;
      indxt = indx(l);
      aval = a(mask(indxt));

    else

      indxt = indx(ir);
      aval = a(mask(indxt));
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
        if ( a(mask(indx(j))) < a(mask(indx(j+1))) )
          j = j + 1;
        end
      end

      if ( aval < a(mask(indx(j))) )
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
