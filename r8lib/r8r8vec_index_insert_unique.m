function [ n, x, y, indx, ival, ierror ] = r8r8vec_index_insert_unique ( ...
  n, x, y, indx, xval, yval )

%*****************************************************************************80
%
%% R8R8VEC_INDEX_INSERT_UNIQUE inserts a unique R8R8 value in an indexed sorted list.
%
%  Discussion:
%
%    If the input value does not occur in the current list, it is added,
%    and N, X, Y and INDX are updated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer MAXN, the maximum size of the list.
%
%    Input, integer N, the size of the list.
%
%    Input, real X(N), Y(N), the list of DD vectors.
%
%    Input, integer INDX(N), the sort index of the list.
%
%    Input, real XVAL, YVAL, the value to be inserted if it is
%    not already in the list.
%
%    Output, integer N, the updated size of the list.
%
%    Output, real X(N), Y(N), the updated list of DD vectors.
%
%    Output, integer INDX(N), the updated index of the list.
%
%    Output, integer IVAL, the index in X, Y corresponding to the
%    value XVAL, YVAL.
%
%    Output, integer IERROR, 0 for no error, 1 if an error occurred.
%
  ierror = 0;

  if ( n <= 0 )
    n = 1;
    x(1) = xval;
    y(1) = yval;
    indx(1) = 1;
    ival = 1;
    return
  end
%
%  Does ( XVAL, YVAL ) already occur in ( X, Y )?
%
  [ less, equal, more ] = r8r8vec_index_search ( n, x, y, indx, xval, yval );

  if ( equal == 0 )

    x(n+1) = xval;
    y(n+1) = yval;
    ival = n + 1;
    indx(n+1:-1:more+1) = indx(n:-1:more);
    indx(more) = n + 1;
    n = n + 1;

  else

    ival = indx(equal);

  end

  return
end
