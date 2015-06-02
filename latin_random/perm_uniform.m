function [ p, seed ] = perm_uniform ( n, seed )

%*****************************************************************************80
%
%% PERM_UNIFORM selects a random permutation of N objects.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    12 November 2014
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    A Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of objects to be permuted.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer P(N), a permutation of ( 1, 2, ..., N ), in standard
%    index form.
%
%    Output, integer SEED, the updated random number seed.
%
  p = ( 1 : n );

  for i = 1: n - 1

    [ j, seed ] = i4_uniform_ab ( i, n, seed );

    temp = p(i);
    p(i) = p(j);
    p(j) = temp;

  end

  return
end
