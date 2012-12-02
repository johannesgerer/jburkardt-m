function [ n, x, indx ] = r8vec_index_sort_unique ( n, x )

%*****************************************************************************80
%
%% R8VEC_INDEX_SORT_UNIQUE creates a sort index for an R8VEC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2000
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the current list.
%
%    Input, real X(N), the list.  
%
%    Output, integer N, the number of unique elements in X.
%
%    Output, real X(N), the list contains only unique elements.
%
%    Output, integer INDX(N), the sort index of the list.
%
  n2 = 0
  y = [];
  indx = [];

  for i = 1 : n
    [ n2, y, indx ] = r8vec_index_insert_unique ( n2, y, indx, x(i) );
  end

  n = n2;
  x = y(1:n);

  return
end

