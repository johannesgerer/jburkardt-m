function [ n, x, indx ] = r8vec_index_delete_all ( n, x, indx, xval )

%*****************************************************************************80
%
%% R8VEC_INDEX_DELETE_ALL deletes all occurrences of a value from an indexed sorted list.
%
%  Discussion:
%
%    Note that the value of N is adjusted because of the deletions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2005
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
  if ( n < 1 )
    n = 0;
    return
  end

  [ less, equal, more ] = r8vec_index_search ( n, x, indx, xval );

  if ( equal == 0 )
    return
  end

  equal1 = equal;

  while ( 1 )

    if ( equal1 <= 1 )
      break
    end

    if ( x(indx(equal1-1)) ~= xval )
      break
    end

    equal1 = equal1 - 1;

  end

  equal2 = equal;

  while ( 1 )

    if ( n <= equal2 )
      break
    end

    if ( x(indx(equal2+1)) ~= xval )
      break
    end

    equal2 = equal2 + 1;

  end
%
%  Discard certain X values.
%
  put = 0;

  for get = 1 : n

    if ( x(get) ~= xval )
      put = put + 1;
      x(put) = x(get);
    end

  end

  x(put+1:n) = 0.0;
%
%  Adjust the INDX values.
%
  for equal = equal1 : equal2
    for i = 1 : n
      if ( indx(equal) < indx(i) )
        indx(i) = indx(i) - 1;
      end
    end
  end
%
%  Discard certain INDX values.
%
  indx(equal1:n+equal1-equal2-1) = indx(equal2+1:n);
  indx(n+equal1-equal2:n) = 0;
%
%  Adjust N.
%
  n = put;

  return
end

