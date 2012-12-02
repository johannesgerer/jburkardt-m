function [ unique_num, b ] = i4row_sorted_unique ( m, n, a )

%*****************************************************************************80
%
%% I4ROW_SORTED_UNIQUE keeps unique elements in an I4ROW.
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
%    Output, integer B(UNIQUE_NUM,N), a sorted array, containing
%    UNIQUE_NUM rows of unique data.
%
  if ( n <= 0 )
    unique_num = 0;
    b = [];
    return
  end if

  i1 = 1;
  b(1,1:n) = a(1,1:n);

  for i2 = 2 : m

    if ( any ( b(i1,1:n) ~= a(i2,1:n) ) )
      i1 = i1 + 1;
      b(i1,1:n) = a(i2,1:n);
    end

  end

  unique_num = i1;

  return
end
