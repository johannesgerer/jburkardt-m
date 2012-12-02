function unique_num = i4vec_unique_count ( n, a )

%*****************************************************************************80
%
%% I4VEC_UNIQUE_COUNT counts the unique elements in an unsorted I4VEC.
%
%  Discussion:
%
%    Because the array is unsorted, this algorithm is O(N^2).
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
%    Input, integer A(N), the unsorted array to examine.
%
%    Output, integer UNIQUE_NUM, the number of unique elements of A.
%
  unique_num = 0;

  for i = 1 : n

    unique_num = unique_num + 1;

    for j = 1 : i-1

      if ( a(i) == a(j) )
        unique_num = unique_num - 1;
        break
      end

    end

  end

  return
end
