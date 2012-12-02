function rank = index_rank0 ( n, hi, a )

%*****************************************************************************80
%
%% INDEX_RANK0 ranks an index vector within given upper limits.
%
%  Example:
%
%    N = 3,
%    HI = 3
%    A = ( 3, 1, 2 )
%
%    RANK = 12
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
%    Input, integer HI, the upper limit for the array indices.
%    The lower limit is implicitly 1, and HI should be at least 1.
%
%    Input, integer A(N), the index vector to be ranked.
%
%    Output, integer RANK, the rank of the index vector, or -1 if A
%    is not a legal index.
%
  rank = -1;

  for i = 1 : n
    if ( a(i) < 1 | hi < a(i) )
      return;
    end
  end

  rank = 0;
  for i = n : -1 : 1
    rank = hi * rank + a(i);
  end

  rank = 1;
  range = 1;
  for i = 1 : n
    rank = rank + ( a(i) - 1 ) * range;
    range = range * hi;
  end

  return
end
