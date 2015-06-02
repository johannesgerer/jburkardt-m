function [ a2, b2 ] = i4vec2_sorted_uniquely ( n1, a1, b1, n2 )

%*****************************************************************************80
%
%% I4VEC2_SORTED_UNIQUELY copies unique elements from a sorted I4VEC2.
%
%  Discussion:
%
%    An I4VEC2 is a pair of I4VEC's.
%
%    An I4VEC is a vector of I4's.
%
%    Entry K of an I4VEC2 is the pair of values located
%    at the K-th entries of the two I4VEC's.
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
%    14 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N1, the number of items.
%
%    Input, integer A1(N1), B1(N1), the array of items.
%
%    Input, integer N2, the number of unique items.
%
%    Output, integer A2(N2), B2(N2), the array of unique items.
%
  a2 = zeros(n2,1);
  b2 = zeros(n2,1);

  i1 = 1;
  i2 = 1;
  a2(i2) = a1(i1);
  b2(i2) = b1(i1);

  for i1 = 2 : n1

    if ( a1(i1) ~= a2(i2) || b1(i1) ~= b2(i2) )

      i2 = i2 + 1;

      a2(i2) = a1(i1);
      b2(i2) = b1(i1);

    end

  end

  return
end