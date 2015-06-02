function [ n, x, indx ] = r8vec_index_delete_dupes ( n, x, indx )

%*****************************************************************************80
%
%% R8VEC_INDEX_DELETE_DUPES deletes duplicates from an indexed sorted list.
%
%  Discussion:
%
%    The output quantities N2, X2, and INDX2 are computed from the
%    input quantities by sorting, and eliminating duplicates.
%
%    The output arrays should be dimensioned of size N, unless the user
%    knows in advance what the value of N2 will be.
%
%    The output arrays may be identified with the input arrays.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the input list.
%
%    Input, real X(N), the list.  
%
%    Input, integer INDX(N), the sort index of the list.
%
%    Output, integer N, the number of unique entries in X.
%
%    Output, real X(N), a copy of the list which has
%    been sorted, and made unique.
%
%    Output, integer INDX(N), the sort index of the new list.
%
  i = 0;
  n3 = 0;

  while ( 1 )

    i = i + 1;

    if ( n < i )
      break
    end

    if ( 1 < i )
      if ( x(indx(i)) == x3(n3) )
        continue
      end
    end

    n3 = n3 + 1;
    x3(n3) = x(indx(i));

  end
%
%  Copy data into output arrays.
%
  n = n3;
  x(1:n) = x3(1:n3);
  indx = i4vec_indicator1 ( n );

  return
end
