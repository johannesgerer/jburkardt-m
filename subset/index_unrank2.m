function a = index_unrank2 ( n, lo, hi, rank )

%*****************************************************************************80
%
%% INDEX_UNRANK2 unranks an index vector within given lower and upper limits.
%
%  Example:
%
%    N = 3,
%    LO(1) = 1, LO(2) = 10, LO(3) = 4
%    HI(1) = 2, HI(2) = 11, HI(3) = 6
%    RANK = 7
%
%    A = ( 1, 11, 5 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in A.
%
%    Input, integer LO(N), HI(N), the lower and upper limits for the array
%    indices.  It should be the case that LO(I) <= HI(I) for each I.
%
%    Input, integer RANK, the rank of the desired index.
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

  range = 1;
  for i = 1 : n
    range = range * ( hi(i) + 1 - lo(i) );
  end
%
%  The rank might be too large.
%
  if ( range < rank )
    return
  end

  k = rank - 1;

  for i = n : -1 : 1
    range = floor ( range / ( hi(i) + 1 - lo(i) ) );
    j = floor ( k / range );
    a(i) = j + lo(i);
    k = k - j * range;
  end

  return
end
