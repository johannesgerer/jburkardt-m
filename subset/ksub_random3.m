function [ a, seed ] = ksub_random3 ( n, k, seed )

%*****************************************************************************80
%
%% KSUB_RANDOM3 selects a random subset of size K from a set of size N.
%
%  Discussion:
%
%    This routine uses Floyd's algorithm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 June 2004
%
%  Author:
%
%    John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the size of the set from which subsets are drawn.
%
%    Input, integer K, number of elements in desired subsets.  K must
%    be between 0 and N.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(N).  I is an element of the subset
%    if A(I) = 1, and I is not an element if A(I)=0.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  if ( k < 0 | n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_RANDOM3 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  K = %d\n', k );
    fprintf ( 1, '  but 0 <= K <= N is required!\n' );
    error ( 'KSUB_RANDOM3 - Fatal error!' );
  end

  a(1:n) = 0;

  if ( k == 0 )
    return
  end

  for i = n-k+1 : n

    [ j, seed ] = i4_uniform ( 1, i, seed );

    if ( a(j) == 0 )
      a(j) = 1;
    else
      a(i) = 1;
    end

  end

  return
end
