function unique_num = i4vec_sorted_unique_count ( n, a )

%*****************************************************************************80
%
%% I4VEC_SORTED_UNIQUE_COUNT counts the unique elements in a sorted I4VEC.
%
%  Discussion:
%
%    Because the array is sorted, this algorithm is O(N).
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
%    Input, integer A(N), the sorted array to examine.
%
%    Output, integer UNIQUE_NUM, the number of unique elements of A.
%
  unique_num = 0;

  if ( n < 1 )
    return;
  end

  unique_num = 1;

  for i = 2 : n

    if ( a(i-1) ~= a(i) )
      unique_num = unique_num + 1;
    end

  end

  return
end
