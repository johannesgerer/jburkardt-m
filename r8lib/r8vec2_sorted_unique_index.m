function [ unique_num, indx ] = r8vec2_sorted_unique_index ( n, a1, a2 )

%*****************************************************************************80
%
%% R8VEC2_SORTED_UNIQUE_INDEX indexes unique elements in a sorted R8VEC2.
%
%  Discussion:
%
%    An R8VEC2 is two R8VEC's.
%
%    An R8VEC is a vector of R8 values.
%
%    Item I is stored as the pair A1(I), A2(I).
%
%    The items must have been sorted, or at least it should be the
%    case that equal items are stored in adjacent vector locations.
%
%    If the items are not sorted, then this routine will only
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
%    Output, integer INDX(N), contains in entries 1 through UNIQUE_NUM an index
%    array of the unique items.  To build new arrays with no repeated elements:
%      B1(1:UNIQUE_NUM) = A1(INDX(1:UNIQUE_NUM))
%
  if ( n <= 0 )
    unique_num = 0;
    return;
  end

  unique_num = 1;
  indx(1) = 1;

  for itest = 2 : n

    if ( a1(itest-1) ~= a1(itest) || a2(itest-1) ~= a2(itest) )

      unique_num = unique_num + 1;

      indx(unique_num) = itest;

    end

  end

  return
end
