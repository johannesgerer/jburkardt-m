function [ u, seed ] = unicycle_random ( n, seed )

%*****************************************************************************80
%
%% UNICYCLE_RANDOM selects a random unicycle of N objects.
%
%  Discussion:
%
%    The routine assumes the objects are labeled 1, 2, ... N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2012
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms for Computers and Calculators,
%    Second Edition,
%    Academic Press, 1978,
%    ISBN: 0-12-519260-6,
%    LC: QA164.N54.
%
%  Parameters:
%
%    Input, integer N, the number of objects to be permuted.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
%    Output, integer U(N), a unicycle in sequence form.
%
  u = i4vec_indicator ( n );

  for i = 2 : n
    [ j, seed ] = i4_uniform ( i, n, seed );
    t = u(i);
    u(i) = u(j);
    u(j) = t;
  end

  return
end
