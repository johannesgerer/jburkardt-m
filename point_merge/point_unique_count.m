function unique_num = point_unique_count ( m, n, a )

%*****************************************************************************80
%
%% POINT_UNIQUE_COUNT counts the unique points.
%
%  Discussion:
%
%    The input data is an M x N array A, representing the M-dimensional
%    coordinates of N points.
%
%    The algorithm relies on the fact that, in a sorted list, points that
%    are exactly equal must occur consecutively.
%
%    The output is the number of unique points in the list.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 July 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows.
%
%    Input, integer N, the number of columns.
%
%    Input, real A(M,N), the array of N columns of data.
%
%    Output, integer UNIQUE_NUM, the number of unique points.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end
%
%  Implicitly sort the array.
%
  indx = r8col_sort_heap_index_a ( m, n, a );
%
%  Two points are considered equal only if they exactly match.
%  In that case, equal points can only occur as consecutive items
%  in the sorted list.   This makes counting easy.
%
  unique_num = 1;
  unique_index = indx(1);

  for j = 2 : n

    if ( any ( a(1:m,unique_index) ~= a(1:m,indx(j)) ) )
      unique_num = unique_num + 1;
      unique_index = indx(j);
    end

  end

  return
end
