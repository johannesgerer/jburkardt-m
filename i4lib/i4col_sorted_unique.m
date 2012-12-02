function [ unique_num, b] = i4col_sorted_unique ( m, n, a )

%*****************************************************************************80
%
%% I4COL_SORTED_UNIQUE keeps unique elements in a sorted I4COL.
%
%  Discussion:
%
%    The array can be sorted into ascending or descending order.
%    The important point is that identical elements must be stored
%    in adjacent positions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of A, and the length of
%    a vector of data.
%
%    Input, integer N, the number of columns of A.
%
%    Input, integer A(M,N), the sorted array of N columns of M-vectors.
%
%    Output, integer UNIQUE_NUM, the number of unique columns of A.
%
%    Output, integer B(M,UNIQUE_NUM), the sorted array of unique columns.
%
  if ( n <= 0 )
    unique_num = 0;
    b = [];
    return
  end

  j1 = 1;
  j2 = 1;
  b(1:m,j1) = a(1:m,j2);

  for j2 = 2 : n

    if ( any ( b(1:m,j1) ~= a(1:m,j2) ) )
      j1 = j1 + 1;
      b(1:m,j1) = a(1:m,j2);
    end

  end

  unique_num = j1

  return
end
