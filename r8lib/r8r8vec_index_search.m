function [ less, equal, more ] = r8r8vec_index_search ( n, x, y, indx, ...
  xval, yval )

%*****************************************************************************80
%
%% R8R8VEC_INDEX_SEARCH searches for an R8R8 value in an indexed sorted list.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the current list.
%
%    Input, real X(N), Y(N), the list.
%
%    Input, integer INDX(N), the sort index of the list.
%
%    Input, real XVAL, YVAL, the value to be sought.
%
%    Output, integer LESS, EQUAL, MORE, the indexes in INDX of the
%    entries of X that are just less than, equal to, and just greater
%    than XVAL.  If XVAL does not occur in X, then EQUAL is zero.
%    If XVAL is the minimum entry of X, then LESS is 0.  If XVAL
%    is the greatest entry of X, then MORE is N+1.
%
  if ( n <= 0 )
    less = 0;
    equal = 0;
    more = 0;
    return
  end

  lo = 1;
  hi = n;

  xlo = x(indx(lo));
  ylo = y(indx(lo));

  xhi = x(indx(hi));
  yhi = y(indx(hi));

  compare = r8r8_compare ( xval, yval, xlo, ylo );

  if ( compare == -1 )
    less = 0;
    equal = 0;
    more = 1;
    return
  elseif ( compare == 0 )
    less = 0;
    equal = 1;
    more = 2;
    return
  end

  compare = r8r8_compare ( xval, yval, xhi, yhi );

  if ( compare == 1 )
    less = n;
    equal = 0;
    more = n + 1;
    return
  elseif ( compare == 0 )
    less = n - 1;
    equal = n;
    more = n + 1;
    return
  end

  while ( 1 )

    if ( lo + 1 == hi )
      less = lo;
      equal = 0;
      more = hi;
      return
    end

    mid = round ( ( lo + hi ) / 2 );
    xmid = x(indx(mid));
    ymid = y(indx(mid));

    compare = r8r8_compare ( xval, yval, xmid, ymid );

    if ( compare == 0 )
      equal = mid;
      less = equal - 1;
      more = equal + 1;
      return
    elseif ( compare == -1 )
      hi = mid;
    elseif ( compare == +1 )
      lo = mid;
    end

  end

  return
end
