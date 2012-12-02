function [ a, seed ] = subset_random ( n, seed )

%*****************************************************************************80
%
%% SUBSET_RANDOM selects a random subset of an N-set.
%
%  Example:
%
%    N = 4
%
%    0 0 1 1
%    0 1 0 1
%    1 1 0 1
%    0 0 1 0
%    0 0 0 1
%    1 1 0 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    24 November 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Albert Nijenhuis, Herbert Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the size of the full set.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(N).  A vector to hold the information about
%    the set chosen.  On return, if A(I) = 1, then
%    I is in the random subset, otherwise, A(I) = 0
%    and I is not in the random subset.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for i = 1 : n
    [ a(i), seed ] = i4_uniform ( 0, 1, seed );
  end

  return
end
