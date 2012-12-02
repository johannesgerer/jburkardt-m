function a = index_unrank0 ( n, hi, rank )

%*****************************************************************************80
%
%% INDEX_UNRANK0 unranks an index vector within given upper limits.
%
%  Example:
%
%    N = 3,
%    HI = 3
%    RANK = 12
%
%    A = ( 3, 1, 2 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, integer HI, the upper limit for the array indices.
%    The lower limit is implicitly 1, and HI should be at least 1.
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

  range = hi^n;
%
%  The rank might be too large.
%
  if ( range < rank )
    return
  end

  k = rank - 1;
  for i = n : -1 : 1
    range = floor ( range / hi );
    j = floor ( k / range );
    a(i) = j + 1;
    k = k - j * range;
  end

  return
end
