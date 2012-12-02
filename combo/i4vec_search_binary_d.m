function indx = i4vec_search_binary_d ( n, a, b )

%*****************************************************************************80
%
%% I4VEC_SEARCH_BINARY_D searches a descending sorted I4VEC.
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
%    Algorithm 1.9,
%    Donald Kreher and Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998, page 26.
%
%  Parameters:
%
%    Input, integer N, the number of elements in the vector.
%
%    Input, integer A(N), the array to be searched.  A must
%    be sorted in descending order.
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
    elseif ( b < a(mid) )
      low = mid + 1;
    elseif ( a(mid) < b )
      high = mid - 1;
    end

  end

  return
end
