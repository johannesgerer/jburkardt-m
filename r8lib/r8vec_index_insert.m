function [ n, x, indx ] = r8vec_index_insert ( n, x, indx, xval )

%*****************************************************************************80
%
%% R8VEC_INDEX_INSERT inserts a value in an indexed sorted list.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2000
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
%    Input, real XVAL, the value to be sought.
%
%    Output, integer N, the size of the current list.
%
%    Output, real X(N), the list.
%
%    Output, integer INDX(N), the sort index of the list.
%
  if ( n <= 0 )
    n = 1;
    x = [ xval ];
    indx = [ 1 ];
    return
  end

  [ less, equal, more ] = r8vec_index_search ( n, x, indx, xval );

  x(n+1) = xval;
  indx(n+1:-1:more+1) = indx(n:-1:more);
  indx(more) = n + 1;
  n = n + 1;

  return
end
