function indx = i4vec_search_binary_a ( n, a, b )

%*****************************************************************************80
%
%% I4VEC_SEARCH_BINARY_A searches an ascending sorted I4VEC.
%
%  Discussion:
%
%    Binary search is used.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher and Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998, page 26.
%
%  Parameters:
%
%    Input, integer N, the number of elements in the vector.
%
%    Input, integer A(N), the array to be searched.  A must
%    be sorted in ascending order.
%
%    Input, integer B, the value to be searched for.
%
%    Output, integer INDX, the result of the search.
%    -1, B does not occur in A.
%    I, A(I) = B.
%
  indx = -1;

  low = 1;
  high = n;

  while ( low <= high )

    mid = floor ( ( low + high ) / 2 );

    if ( a(mid) == b )
      indx = mid;
      break
    elseif ( a(mid) < b )
      low = mid + 1;
    elseif ( b < a(mid) )
      high = mid - 1;
    end

  end

  return
end
