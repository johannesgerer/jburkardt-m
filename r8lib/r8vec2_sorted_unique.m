function [ unique_num, a1, a2 ] = r8vec2_sorted_unique ( n, a1, a2 )

%*****************************************************************************80
%
%% R8VEC2_SORTED_UNIQUE keeps unique elements in a sorted R8VEC2.
%
%  Discussion:
%
%    An R8VEC2 is two R8VEC's.
%
%    An R8VEC is a vector of R8 values.
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
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items.
%
%    Input, real A1(N), A2(N), the array of N items.
%
%    Output, integer UNIQUE_NUM, the number of unique items.
%
%    Output, real A1(UNIQUE_NUM), A2(UNIQUE_NUM), the array of unique items.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end

  unique_num = 1;

  for itest = 2 : n

    if ( a1(itest) ~= a1(unique_num) || a2(itest) ~= a2(unique_num) )

      unique_num = unique_num + 1;

      a1(unique_num) = a1(itest);
      a2(unique_num) = a2(itest);

    end

  end

  a1 = a1(1:unique_num);
  a2 = a2(1:unique_num);

  return
end
