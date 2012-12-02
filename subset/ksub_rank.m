function rank = ksub_rank ( k, a )

%*****************************************************************************80
%
%% KSUB_RANK computes the rank of a K subset of an N set.
%
%  Discussion:
%
%    The routine accepts an array representing a subset of size K from a set
%    of size N, and returns the rank (or order) of that subset. 
%
%    It uses the same ranking that KSUB_NEXT2 uses to generate all the subsets 
%    one at a time.  
%
%    Note the value of N is not input, and is not, in fact,
%    needed.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer K, the number of elements in the subset.
%
%    Input, integer A(K), contains K distinct numbers between
%    1 and N, in order.
%
%    Output, integer RANK, the rank of this subset.
%
  rank = 0;

  for i = 1 : k

    iprod = 1;

    for j = i+1 : a(i)-1
      iprod = iprod * j;
    end

    for j = 1 : a(i)-i-1
      iprod = floor ( iprod / j );
    end

    if ( a(i) == 1 )
      iprod = 0;
    end

    rank = rank + iprod;

  end

  rank = rank + 1;

  return
end
