function singleton_num = i4col_sorted_singleton_count ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORTED_SINGLETON_COUNT counts singletons in an I4COL.
%
%  Discussion:
%
%    The columns of the array may be ascending or descending sorted.
%
%    A "singleton" is an item that occurs exactly once.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2005
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
%    Output, integer SINGLETON_NUM, the number of singletons.
%
  singleton_num = 0;

  if ( n <= 0 )
    return
  end

  differ_from_next = 1;

  for j = 1 : n

    differ_from_previous = differ_from_next;

    if ( j < n )
      differ_from_next = ( a(1:m,j) ~= a(1:m,j+1) );
    else
      differ_from_next = 1;
    end

    if ( differ_from_previous & differ_from_next )
      singleton_num = singleton_num + 1;
    end

  end

  return
end
