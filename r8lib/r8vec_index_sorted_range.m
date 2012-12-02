function [ i_lo, i_hi ] = r8vec_index_sorted_range ( n, r, indx, r_lo, r_hi )

%*****************************************************************************80
%
%% R8VEC_INDEX_SORTED_RANGE: search index sorted vector for elements in a range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items in the vector.
%
%    Input, real R(N), the index sorted vector.
%
%    Input, integer INDX(N), the vector used to sort R.
%    The vector R(INDX(*)) is sorted.
%
%    Input, real R_LO, R_HI, the limits of the range.
%
%    Output, integer I_LO, I_HI, the range of indices
%    so that I_LO <= I <= I_HI => R_LO <= R(INDX(I)) <= R_HI.  If no
%    values in R lie in the range, then I_HI < I_LO will be returned.
%

%
%  Cases we can handle immediately.
%
  if ( r(indx(n)) < r_lo )
    i_lo = n + 1;
    i_hi = n;
    return
  end

  if ( r_hi < r(indx(1)) )
    i_lo = 1;
    i_hi = 0;
    return
  end
%
%  Are there are least two intervals?
%
  if ( n == 1 )
    if ( r_lo <= r(indx(1)) && r(indx(1)) <= r_hi )
      i_lo = 1;
      i_hi = 1;
    else
      i_lo = 0;
      i_hi = -1;
    end
    return
  end
%
%  Bracket R_LO.
%
  if ( r_lo <= r(indx(1)) )

    i_lo = 1;

  else
%
%  R_LO is in one of the intervals spanned by R(INDX(J1)) to R(INDX(J2)).
%  Examine the intermediate interval [R(INDX(I1)), R(INDX(I1+1))].
%  Does R_LO lie here, or below or above?
%
    j1 = 1;
    j2 = n;
    i1 = floor ( ( j1 + j2 - 1 ) / 2 );
    i2 = i1 + 1;

    while ( 1 )

      if ( r_lo < r(indx(i1)) )
        j2 = i1;
        i1 = floor ( ( j1 + j2 - 1 ) / 2 );
        i2 = i1 + 1;
      elseif ( r(indx(i2)) < r_lo )
        j1 = i2;
        i1 = floor ( ( j1 + j2 - 1 ) / 2 );
        i2 = i1 + 1;
      else
        i_lo = i1;
        break
      end

    end

  end
%
%  Bracket R_HI.
%
  if ( r(indx(n)) <= r_hi )

    i_hi = n;

  else

    j1 = i_lo;
    j2 = n;
    i1 = floor ( ( j1 + j2 - 1 ) / 2 );
    i2 = i1 + 1;

    while ( 1 )

      if ( r_hi < r(indx(i1)) )
        j2 = i1;
        i1 = floor ( ( j1 + j2 - 1 ) / 2 );
        i2 = i1 + 1;
      elseif ( r(indx(i2)) < r_hi )
        j1 = i2;
        i1 = floor ( ( j1 + j2 - 1 ) / 2 );
        i2 = i1 + 1;
      else
        i_hi = i2;
        break
      end

    end

  end
%
%  We expect to have computed the largest I_LO and smallest I_HI such that
%    R(INDX(I_LO)) <= R_LO <= R_HI <= R(INDX(I_HI))
%  but what we want is actually
%    R_LO <= R(INDX(I_LO)) <= R(INDX(I_HI)) <= R_HI
%  which we can usually get simply by incrementing I_LO and decrementing I_HI.
%
  if ( r(indx(i_lo)) < r_lo )
    i_lo = i_lo + 1;
    if ( n < i_lo )
      i_hi = i_lo - 1;
    end
  end

  if ( r_hi < r(indx(i_hi)) )
    i_hi = i_hi - 1;
    if ( i_hi < 1 )
      i_lo = i_hi + 1;
    end
  end

  return
end
