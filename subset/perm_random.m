function [ p, seed ] = perm_random ( n, seed )

%*****************************************************************************80
%
%% PERM_RANDOM selects a random permutation of N objects.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 March 2003
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
%    Input, integer N, the number of objects to be permuted.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer P(N), a permutation of ( 1, 2, ..., N ), in standard
%    index form.
%
%    Output, integer SEED, the updated random number seed.
%
  p = (1:n);

  for i = 1: n

    [ j, seed ] = i4_uniform ( i, n, seed );

    temp = p(i);
    p(i) = p(j);
    p(j) = temp;
 
  end

  return
end
