function [ p, seed ] = perm0_uniform ( n, seed )

%*****************************************************************************80
%
%% PERM0_UNIFORM selects a random permutation of 0, ..., N-1.
%
%  Discussion:
%
%    The algorithm is known as the Fisher-Yates or Knuth shuffle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 May 2015
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
%    Output, integer P(N), a permutation of ( 0, ..., N-1 ), in standard
%    index form.
%
%    Output, integer SEED, the updated random number seed.
%
  p = ( 0 : n - 1 );

  for i = 1: n - 1

    [ j, seed ] = i4_uniform_ab ( i, n, seed );

    temp = p(i);
    p(i) = p(j);
    p(j) = temp;

  end

  return
end
