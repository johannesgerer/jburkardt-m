function left = r8vec_bracket4 ( nt, t, ns, s )

%*****************************************************************************80
%
%% R8VEC_BRACKET4 finds the interval to each of a vector of values.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
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
%    30 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NT, length of the input array.
%
%    Input, real T(NT), an array that has been sorted
%    into ascending order.
%
%    Input, integer NS, the number of points to be bracketed.
%
%    Input, real S(NS), values to be bracketed by entries of T.
%
%    Output, integer LEFT(NS).
%    LEFT(I) is set so that the interval [ T(LEFT(I)), T(LEFT(I)+1) ]
%    is the closest to S(I); it either contains S(I), or else S(I)
%    lies outside the interval [ T(1), T(NT) ].
%

%
%  Check the input data.
%
  if ( nt < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_BRACKET4 - Fatal error!\n' );
    fprintf ( 1, '  NT must be at least 2.\n' );
    error ( 'R8VEC_BRACKET4 - Fatal error!' );
  end

  for i = 1 : ns

    left(i) = floor ( ( nt + 1 ) / 2 );
%
%  CASE 1: S < T(LEFT):
%  Search for S in [T(I), T(I+1)] for intervals I = 1 to LEFT-1.
%
    if ( s(i) < t(left(i)) )

      if ( left(i) == 1 )
        continue
      elseif ( left(i) == 2 )
        left(i) = 1;
        continue
      elseif ( t(left(i)-1) <= s(i) )
        left(i) = left(i) - 1;
        continue
      elseif ( s(i) <= t(2) )
        left(i) = 1;
        continue
      end
%
%  ...Binary search for S in [T(I), T(I+1)] for intervals I = 2 to LEFT-2.
%
      low = 2;
      high = left(i) - 2;

      while ( 1 )
  
        if ( low == high )
          left(i) = low;
          break
        end

        mid = floor ( ( low + high + 1 ) / 2 );

        if ( t(mid) <= s(i) )
          low = mid;
        else
          high = mid - 1;
        end

      end
%
%  CASE2: T(LEFT+1) < S:
%  Search for S in [T(I),T(I+1)] for intervals I = LEFT+1 to N-1.
%
    elseif ( t(left(i)+1) < s(i) )

      if ( left(i) == nt - 1 )
        continue
      elseif ( left(i) == nt - 2 )
        left(i) = left(i) + 1;
        continue
      elseif ( s(i) <= t(left(i)+2) )
        left(i) = left(i) + 1;
        continue
      elseif ( t(nt-1) <= s(i) )
        left(i) = nt - 1;
        continue
      end
%
%  ...Binary search for S in [T(I), T(I+1)] for intervals I = LEFT+2 to NT-2.
%
      low = left(i) + 2;
      high = nt - 2;

      while ( 1 )

        if ( low == high )
          left(i) = low;
          break
        end

        mid = floor ( ( low + high + 1 ) / 2 );

        if ( t(mid) <= s(i) )
          low = mid;
        else
          high = mid - 1;
        end

      end
%
%  CASE3: T(LEFT) <= S <= T(LEFT+1):
%  S is in [T(LEFT), T(LEFT+1)].
%
    else

    end

  end

  return
end
