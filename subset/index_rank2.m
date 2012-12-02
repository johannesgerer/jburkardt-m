function rank = index_rank2 ( n, lo, hi, a )

%*****************************************************************************80
%
%% INDEX_RANK2 ranks an index vector within given lower and upper limits.
%
%  Example:
%
%    N = 3,
%    LO(1) = 1, LO(2) = 10, LO(3) = 4
%    HI(1) = 2, HI(2) = 11, HI(3) = 6
%    A = ( 1, 11, 5 )
%
%    RANK = 7
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2004
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
%    indices.  LO(I) should be less than or equal to HI(I), for each I.
%
%    Input, integer A(N), the index vector to be ranked.
%
%    Output, integer RANK, the rank of the index vector, or -1 if A
%    is not a legal index vector.
%
  for i = 1 : n
    if ( a(i) < lo(i) | hi(i) < a(i) )
      rank = -1;
      return
    end
  end

  rank = 1;
  range = 1;
  for i = 1 : n
    rank = rank + ( a(i) - lo(i) ) * range;
    range = range * ( hi(i) + 1 - lo(i) );
  end

  return
end
