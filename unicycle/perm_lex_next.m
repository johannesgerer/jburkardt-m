function [ p, rank ] = perm_lex_successor ( n, p, rank )

%*****************************************************************************80
%
%% PERM_LEX_SUCCESSOR computes the lexicographic permutation successor.
%
%  Example:
%
%    RANK  Permutation
%
%       0  1 2 3 4
%       1  1 2 4 3
%       2  1 3 2 4
%       3  1 3 4 2
%       4  1 4 2 3
%       5  1 4 3 2
%       6  2 1 3 4
%       ...
%      23  4 3 2 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 February 2000
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer N, the number of values being permuted.
%    N must be positive.
%
%    Input, integer P(N), the input permutation.
%
%    Input, integer RANK, the rank of the input permutation.
%    If RANK = -1, then the input permutation is ignored, and the
%    function returns the first permutation in the ordered list,
%    with RANK = 1.
%
%    Output, integer P(N), the successor permutation.  
%    If the input permutation was the last in the ordered list,
%    then the output permutation is the first permutation.
%
%    Output, integer RANK, the rank of the output permutation.
%

%
%  If RANK <= -1, return the first permutation.
%
  if ( rank <= -1 ) 
    p = 1 : n;
    rank = 0;
    return
  end
%
%  Make sure the input permutation is legal.
%
  perm_check ( n, p );
%
%  Seek I, the highest index for which the next element is bigger.
%
  i = n - 1;

  while ( 1 )

    if ( i <= 0 )
      break
    end

    if ( p(i) <= p(i+1) )
      break
    end

    i = i - 1;

  end
%
%  If no I could be found, then we have reach the final permutation,
%  N, N-1, ..., 2, 1.  Time to start over again.
%
  if ( i == 0 )
    p = 1 : n;
    rank = -1;
  else
%
%  Otherwise, look for the the highest index after I whose element
%  is bigger than I's.  We know that I+1 is one such value, so the
%  loop will never fail.
%
    j = n;
    while ( p(j) < p(i) ) 
      j = j - 1;
    end
%
%  Interchange elements I and J.
%
    t    = p(i);
    p(i) = p(j);
    p(j) = t;
%
%  Reverse the elements from I+1 to N.
%
    p(i+1:n) = p(n:-1:i+1);

    rank = rank + 1;

  end

  return
end
