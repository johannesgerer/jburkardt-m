function unique_num = i4vec2_sorted_unique_count ( n, a1, a2 )

%*****************************************************************************80
%
%% I4VEC2_SORTED_UNIQUE_COUNT counts unique elements of a sorted I4VEC2.
%
%  Discussion:
%
%    Item I is stored as the pair A1(I), A2(I).
%
%    The items must have been sorted, or at least it must be the
%    case that equal items are stored in adjacent vector locations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 July 2014
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
%    Output, integer UNIQUE_NUM, the number of unique items.
%
  unique_num = 0;

  if ( n <= 0 )
    return
  end

  iu = 1;
  unique_num = 1;
  
  for i = 2 : n

    if ( a1(i) ~= a1(iu) || a2(i) ~= a2(iu) )
      iu = i;
      unique_num = unique_num + 1;
    end

  end

  return
end
