function [ nuniq, b1, b2 ] = i4vec2_sorted_unique ( n, a1, a2 )

%*****************************************************************************80
%
%% I4VEC2_SORTED_UNIQUE keeps unique elements of a sorted I4VEC2.
%
%  Discussion:
%
%    Item I is stored as the pair A1(I), A2(I).
%
%    The items must have been sorted, or at least it must be the
%    case that equal items are stored in adjacent vector locations.
%
%    If the items were not sorted, then this routine will only
%    replace a string of equal values by a single representative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items.
%
%    Input, integer A1(N), A2(N), the array of N items.
%
%    Output, integer NUNIQ, the number of unique items.
%
%    Output, integer B1(N), B2(N), an array of NUNIQ unique items.
%
  nuniq = 0;

  if ( n <= 0 )
    return
  end

  itest = 1;
  nuniq = 1;
  b1(nuniq) = a1(itest);
  b2(nuniq) = a2(itest);
  
  for itest = 2 : n

    if ( a1(itest) ~= b1(nuniq) | a2(itest) ~= b2(nuniq) )

      nuniq = nuniq + 1;

      b1(nuniq) = a1(itest);
      b2(nuniq) = a2(itest);

    end

  end

  return
end
