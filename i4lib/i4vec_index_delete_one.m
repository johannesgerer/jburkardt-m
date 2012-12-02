function [ n, x, indx ] = i4vec_index_delete_one ( n, x, indx, xval )

%*****************************************************************************80
%
%% I4VEC_INDEX_DELETE_ONE deletes one copy of a value from an indexed sorted I4VEC.
%
%  Discussion:
%
%    If the value occurs in the list more than once, only one copy is deleted.
%
%    Note that the value of N is adjusted because of the deletions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    04 November 2005
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
%    Input, integer XVAL, the value to be sought.
%
%    Output, integer N, the size of the current list.
%
%    Output, integer X(N), the list.
%
%    Output, integer INDX(N), the sort index of the list.
%
  if ( n < 1 )
    n = 0;
    return
  end

  [ less, equal, more ] = i4vec_index_search ( n, x, indx, xval );

  if ( equal ~= 0 )
    j = indx(equal);
    x(j:n-1) = x(j+1:n);
    indx(equal:n-1) = indx(equal+1:n);
    for i = 1 : n-1
      if ( j < indx(i) )
        indx(i) = indx(i) - 1;
      end
    end
    n = n - 1;
  end

  return
end
