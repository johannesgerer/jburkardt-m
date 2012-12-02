function [ a, seed ] = ksub_random2 ( n, k, seed )

%*****************************************************************************80
%
%% KSUB_RANDOM2 selects a random subset of size K from a set of size N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 December 2003
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
%    Input, integer N, the size of the set.
%
%    Input, integer K, the size of the subset, between 0 and N.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(K), the indices of the selected elements.
%
%    Output, integer SEED, the updated seed for the random number generator.
%
  if ( k < 0 | n < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'KSUB_RANDOM2 - Fatal error!\n' );
    fprintf ( 1, '  N = %d\n', n );
    fprintf ( 1, '  K = %d\n', k );
    fprintf ( 1, '  but 0 <= K <= N is required!\n' );
    error ( 'KSUB_RANDOM2 - Fatal error: Illegal K.' );
  end

  if ( k == 0 )
    a = [];
    return;
  end

  need = k;
  have = 0;

  available = n;
  candidate = 0;

  while ( 1 )

    candidate = candidate + 1;

    [ r, seed ] = r8_uniform_01 ( seed );

    if ( available * r <= need )

      need = need - 1;
      have = have + 1;
      a(have) = candidate;

      if ( need <= 0 )
        break;
      end

    end

    available = available - 1;

  end

  return
end

