function unique_num = i4col_sorted_unique_count ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORTED_UNIQUE_COUNT counts unique elements in an I4COL.
%
%  Discussion:
%
%    The columns of the array may be ascending or descending sorted.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2005
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
%    N columns of data.
%
%    Output, integer UNIQUE_NUM, the number of unique columns.
%
  if ( n <= 0 )
    unique_num = 0;
    return
  end

  unique_num = 1;
  j1 = 1;

  for j2 = 2 : n

    if ( any ( a(1:m,j1) ~= a(1:m,j2) ) )
      unique_num = unique_num + 1;
      j1 = j2;
    end

  end

  return
end
