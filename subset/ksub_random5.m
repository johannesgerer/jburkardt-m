function [ a, seed ] = ksub_random5 ( n, k, seed )

%*****************************************************************************80
%
%% KSUB_RANDOM5 selects a random subset of size K from a set of size N.
%
%  Discussion:
%
%    Consider the set A(1:N) = 1, 2, 3, ... N.
%    Choose a random index I1 between 1 and N, and swap items A(1) and A(I1).
%    Choose a random index I2 between 2 and N, and swap items A(2) and A(I2).
%    repeat K times.
%    A(1:K) is your random K-subset.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the size of the set from which subsets
%    are drawn.
%
%    Input, integer K, number of elements in desired subsets.
%    1 <= K <= N.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, integer A(K), the indices of the randomly
%    chosen elements.
%
  a = zeros ( k, 1 );
%
%  Let B index the set.
%
  b = 1 : n;
%
%  Choose item 1 from N things,
%  choose item 2 from N-1 things,
%  choose item K from N-K+1 things.
%
  for i = 1 : k

    [ j, seed ] = i4_uniform ( i, n, seed );

    t    = b(i);
    b(i) = b(j);
    b(j) = t;

  end
%
%  Copy the first K elements.
%
  a(1:k) = b(1:k);
%
%  Put the elements in ascending order.
%
  a = sort ( a );

  return
end
