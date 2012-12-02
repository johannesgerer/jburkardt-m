function unique_num = i4row_sorted_unique_count ( m, n, a )

%*****************************************************************************80
%
%% I4ROW_SORTED_UNIQUE_COUNT counts unique elements in an I4ROW.
%
%  Discussion:
%
%    The rows of the array may be ascending or descending sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns.
%
%    Input, integer A(M,N), a sorted array, containing
%    M rows of data.
%
%    Output, integer UNIQUE_NUM, the number of unique rows.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end

  unique_num = 1;
  i1 = 1;

  for i2 = 2 : m

    if ( any ( a(i1,1:n) ~= a(i2,1:n) ) )
      unique_num = unique_num + 1;
      i1 = i2;
    end

  end

  return
end
