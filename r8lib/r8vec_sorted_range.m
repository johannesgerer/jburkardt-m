function [ i_lo, i_hi ] = r8vec_sorted_range ( n, r, r_lo, r_hi )

%*****************************************************************************80
%
%% R8VEC_SORTED_RANGE searches a sorted vector for elements in a range.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items in the vector.
%
%    Input, real R(N), the sorted vector.
%
%    Input, real R_LO, R_HI, the limits of the range.
%
%    Output, integer I_LO, I_HI, the range of indices
%    so that I_LO <= I <= I_HI => R_LO <= R(I) <= R_HI.  If no
%    values in R lie in the range, then I_HI < I_LO will be returned.
%

%
%  Cases we can handle immediately.
%
  if ( r(n) < r_lo )
    i_lo = 0;
    i_hi = - 1;
    return
  end

  if ( r_hi < r(1) )
    i_lo = 0;
    i_hi = - 1;
    return
  end
%
%  Are there are least two intervals?
%
  if ( n == 1 )
    if ( r_lo <= r(1) && r(1) <= r_hi )
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
  if ( r_lo <= r(1) )

    i_lo = 1;

  else
%
%  R_LO is in one of the intervals spanned by R(J1) to R(J2).
%  Examine the intermediate interval [R(I1), R(I1+1)].
%  Does R_LO lie here, or below or above?
%
    j1 = 1;
    j2 = n;
    i1 = floor ( ( j1 + j2 - 1 ) / 2 );
    i2 = i1 + 1;

    while ( 1 )

      if ( r_lo < r(i1) )
        j2 = i1;
        i1 = floor ( ( j1 + j2 - 1 ) / 2 );
        i2 = i1 + 1;
      elseif ( r(i2) < r_lo )
        j1 = i2;
        i1 = floor ( ( j1 + j2 - 1 ) / 2 );
        i2 = i1 + 1;
      else
        i_lo = i1;
        break;
      end

    end

  end
%
%  Bracket R_HI
%
  if ( r(n) <= r_hi )

    i_hi = n;

  else

    j1 = i_lo;
    j2 = n;
    i1 = floor ( ( j1 + j2 - 1 ) / 2 );
    i2 = i1 + 1;

    while ( 1 )

      if ( r_hi < r(i1) )
        j2 = i1;
        i1 = floor ( ( j1 + j2 - 1 ) / 2 );
        i2 = i1 + 1;
      elseif ( r(i2) < r_hi )
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
%    R(I_LO) <= R_LO <= R_HI <= R(I_HI)
%  but what we want is actually
%    R_LO <= R(I_LO) <= R(I_HI) <= R_HI
%  which we can usually get simply by incrementing I_LO and decrementing I_HI.
%
  if ( r(i_lo) < r_lo )
    i_lo = i_lo + 1;
    if ( n < i_lo )
      i_hi = i_lo - 1;
    end
  end

  if ( r_hi < r(i_hi) )
    i_hi = i_hi - 1;
    if ( i_hi < 1 )
      i_lo = i_hi + 1;
    end
  end

  return
end
