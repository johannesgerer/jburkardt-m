function x = i4vec_index_order ( n, x, indx )

%*****************************************************************************80
%
%% I4VEC_INDEX_ORDER sorts an I4VEC using an index vector.
%
%  Discussion:
%
%    The index vector itself is not modified.  Therefore, the pair
%    (X,INDX) no longer represents an index sorted vector.  If this
%    relationship is to be preserved, then simply set INDX(1:N)=(1:N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the current list.
%
%    Input, integer X(N), the list. 
%
%    Input, integer INDX(N), the sort index of the list.
%
%    Output, integer X(N), the list has been sorted.
%
  y(1:n) = x(indx(1:n));
  x(1:n) = y(1:n);

  return
end
