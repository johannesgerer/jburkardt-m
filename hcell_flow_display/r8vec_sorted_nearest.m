function index = r8vec_sorted_nearest ( n, a, value )

%% R8VEC_SORTED_NEAREST returns the nearest element in a sorted R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of elements of A.
%
%    Input, real A(N), a sorted vector.
%
%    Input, real VALUE, the value whose nearest vector entry is sought.
%
%    Output, integer INDEX, the index of the nearest
%    entry in the vector.
%
  if ( n < 1 )
    index = -1;
    return
  end

  if ( n == 1 )
    index = 1;
    return
  end

  if ( a(1) < a(n) )

    if ( value < a(1) )
      index = 1;
      return
    elseif ( a(n) < value )
      index = n;
      return
    end
%
%  Seek an interval containing the value.
%
    lo = 1;
    hi = n;

    while ( lo < hi - 1 )

      mid = floor ( ( lo + hi ) / 2 );

      if ( value == a(mid) )
        index = mid;
        return
      elseif ( value < a(mid) )
        hi = mid;
      else
        lo = mid;
      end

    end
%
%  Take the nearest.
%
    if ( abs ( value - a(lo) ) < abs ( value - a(hi) ) )
      index = lo;
    else
      index = hi;
    end

    return
%
%  A descending sorted vector A.
%
  else

    if ( value < a(n) )
      index = n;
      return
    elseif ( a(1) < value )
      index = 1;
      return
    end
%
%  Seek an interval containing the value.
%
    lo = n;
    hi = 1;

    while ( lo < hi - 1 )

      mid = floor ( ( lo + hi ) / 2 );

      if ( value == a(mid) )
        index = mid;
        return
      elseif ( value < a(mid) )
        hi = mid;
      else
        lo = mid;
      end

    end
%
%  Take the nearest.
%
    if ( abs ( value - a(lo) ) < abs ( value - a(hi) ) )
      index = lo;
    else
      index = hi;
    end

    return

  end

  return
end
