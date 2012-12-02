function a = index_unrank1 ( n, hi, rank )

%*****************************************************************************80
%
%% INDEX_UNRANK1 unranks an index vector within given upper limits.
%
%  Example:
%
%    N = 3,
%    HI(1) = 4, HI(2) = 2, HI(3) = 3
%    RANK = 11
%
%    A = ( 3, 1, 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, integer HI(N), the upper limits for the array indices.
%    The lower limit is implicitly 1, and each HI(I) should be at least 1.
%
%    Input, integer RANK, the rank of the desired index vector.
%
%    Output, integer A(N), the index vector of the given rank.
%
  a(1:n) = 0;
%
%  The rank might be too small.
%
  if ( rank < 1 )
    return
  end

  range = prod ( hi(1:n) );
%
%  The rank might be too large.
%
  if ( range < rank )
    return
  end

  k = rank - 1;

  for i = n : -1 : 1
    range = floor ( range / hi(i) );
    j = floor ( k / range );
    a(i) = j + 1;
    k = k - j * range;
  end

  return
end
