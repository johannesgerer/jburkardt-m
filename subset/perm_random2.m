function [ p2, seed ] = perm_random2 ( n, p1, seed )

%*****************************************************************************80
%
%% PERM_RANDOM2 selects a random permutation of N objects.
%
%  Discussion:
%
%    The input values of P are used as labels; that is, the I-th object 
%    is labeled P(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 August 2004
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
%    Input, integer P1(N), a list of labels.  
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer P2(N), the input list has been permuted randomly.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  p2(1:n) = p1(1:n);
  
  for i = 1 : n
    [ j, seed ] = i4_uniform ( i, n, seed );
    [ p2(i), p2(j) ] = i4_swap ( p2(i), p2(j) );
  end

  return
end
