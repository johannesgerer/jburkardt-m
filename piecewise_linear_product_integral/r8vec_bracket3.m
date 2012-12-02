function left = r8vec_bracket3 ( n, t, tval, left )

%*****************************************************************************80
%
%% R8VEC_BRACKET3 finds the interval containing or nearest a given value.
%
%  Discussion:
%
%    The routine always returns the index LEFT of the sorted array
%    T with the property that either
%    *  T is contained in the interval [ T(LEFT), T(LEFT+1) ], or
%    *  T < T(LEFT) = T(1), or
%    *  T > T(LEFT+1) = T(N).
%
%    The routine is useful for interpolation problems, where
%    the abscissa must be located within an interval of data
%    abscissas for interpolation, or the "nearest" interval
%    to the (extreme) abscissa must be found so that extrapolation
%    can be carried out.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, length of the input array.
%
%    Input, real T(N), an array that has been sorted into ascending order.
%
%    Input, real TVAL, a value to be bracketed by entries of T.
%
%    Input, integer LEFT, if 1 <= LEFT <= N-1, LEFT is taken as a suggestion for the
%    interval [ T(LEFT), T(LEFT+1) ] in which TVAL lies.  This interval
%    is searched first, followed by the appropriate interval to the left
%    or right.  After that, a binary search is used.
%
%    Output, integer LEFT, is set so that the interval [ T(LEFT), T(LEFT+1) ]
%    is the closest to TVAL; it either contains TVAL, or else TVAL
%    lies outside the interval [ T(1), T(N) ].
%

%
%  Check the input data.
%
  if ( n < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_BRACKET3 - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 2.\n' );
    error ( 'R8VEC_BRACKET3 - Fatal error!' );
  end
%
%  If LEFT is not between 1 and N-1, set it to the middle value.
%
  if ( left < 1 | n - 1 < left )
    left = floor ( ( n + 1 ) / 2 );
  end
%
%  CASE 1: TVAL < T(LEFT):
%  Search for TVAL in [T(I), T(I+1)] for intervals I = 1 to LEFT-1.
%
  if ( tval < t(left) )

    if ( left == 1 )
      left = 1;
      return
    elseif ( left == 2 )
      left = 1;
      return
    elseif ( t(left-1) <= tval )
      left = left - 1;
      return
    elseif ( tval <= t(2) )
      left = 1;
      return
    end
%
%  ...Binary search for TVAL in [T(I), T(I+1)] for intervals I = 2 to LEFT-2.
%
    low = 2;
    high = left - 2;

    while ( 1 )

      if ( low == high )
        left = low;
        return
      end

      mid = floor ( ( low + high + 1 ) / 2 );

      if ( t(mid) <= tval )
        low = mid;
      else
        high = mid - 1;
      end

    end
%
%  CASE2: T(LEFT+1) < TVAL:
%  Search for TVAL in {T(I),T(I+1)] for intervals I = LEFT+1 to N-1.
%
  elseif ( t(left+1) < tval )

    if ( left == n - 1 )
      return
    elseif ( left == n - 2 )
      left = left + 1;
      return
    elseif ( tval <= t(left+2) )
      left = left + 1;
      return
    elseif ( t(n-1) <= tval )
      left = n - 1;
      return
    end
%
%  ...Binary search for TVAL in [T(I), T(I+1)] for intervals I = LEFT+2 to N-2.
%
    low = left + 2;
    high = n - 2;

    while ( 1 )

      if ( low == high )
        left = low;
        return
      end

      mid = floor ( ( low + high + 1 ) / 2 );

      if ( t(mid) <= tval )
        low = mid;
      else
        high = mid - 1;
      end

    end
%
%  CASE3: T(LEFT) <= TVAL <= T(LEFT+1):
%  T is in [T(LEFT), T(LEFT+1)], as the user said it might be.
%
  else

  end

  return
end
