function [ a, seed ] = compnz_random ( n, k, seed )

%*****************************************************************************80
%
%% COMPNZ_RANDOM selects a random composition of the integer N into K nonzero parts.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 December 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Albert Nijenhuis and Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the integer to be decomposed.
%
%    Input, integer K, the number of parts in the composition.
%    K must be no greater than N.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(K), the parts of the composition.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  if ( n < k )
    a(1:k) = -1;
    return
  end

  [ a, seed ] = ksub_random ( n-1, k-1, seed );

  a(k) = n;
  l = 0;

  for i = 1 : k
    m = a(i);
    a(i) = a(i) - l - 1;
    l = m;
  end

  a(1:k) = a(1:k) + 1;

  return
end
