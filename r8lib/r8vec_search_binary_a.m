function indx = r8vec_search_binary_a ( n, a, aval )

%*****************************************************************************80
%
%% R8VEC_SEARCH_BINARY_A searches an ascending sorted R8VEC.
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
%    01 May 2005
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
%    Input, integer N, the number of elements in the array.
%
%    Input, real A(N), the array to be searched.  The array must
%    be sorted in ascending order.
%
%    Input, real AVAL, the value to be searched for.
%
%    Output, integer INDX, the result of the search.
%    -1, AVAL does not occur in the array.
%    I, A(I) = AVAL.
%
  indx = -1;

  low = 1;
  high = n;

  while ( low <= high )

    mid = floor ( ( low + high ) / 2 );

    if ( a(mid) == aval )
      indx = mid;
      break
    elseif ( a(mid) < aval )
      low = mid + 1;
    elseif ( aval < a(mid) )
      high = mid - 1;
    end

  end

  return
end
