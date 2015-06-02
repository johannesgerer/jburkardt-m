function [ a, seed ] = comp_random ( n, k, seed )

%*****************************************************************************80
%
%% COMP_RANDOM selects a random composition of the integer N into K parts.
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
%    Original FORTRAN77 version by Albert Nijenhuis and Herbert Wilf
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Albert Nijenhuis Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the integer to be decomposed.
%
%    Input, integer K, the number of parts in the composition.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(K), the parts of the composition.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ a, seed ] = ksub_random ( n+k-1, k-1, seed );

  a(k) = n + k;
  l = 0;

  for i = 1 : k
    m = a(i);
    a(i) = a(i) - l - 1;
    l = m;
  end

  return
end
