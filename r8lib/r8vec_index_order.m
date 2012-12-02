function x = r8vec_index_order ( n, x, indx )

%*****************************************************************************80
%
%% R8VEC_INDEX_ORDER sorts an integer vector using an index vector.
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
%    Input, integer INDX(N), the sort index of the list.
%
%    Output, real X(N), the list has been sorted.
%
  y(1:n) = x(indx(1:n));
  x(1:n) = y(1:n);

  return
end
