function [ npart, a, b, seed ] = equiv_random ( n, seed )

%*****************************************************************************80
%
%% EQUIV_RANDOM selects a random partition of a set.
%
%  Discussion:
%
%    The user does not control the number of parts in the partition.
%
%    The equivalence classes are numbered in no particular order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2004
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
%    Input, integer N, the number of elements in the set to be partitioned.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer NPART, the number of classes or parts in the 
%    partition.  NPART will be between 1 and N.
%
%    Output, integer A(N), indicates the class to which each element
%    is assigned.
%
%    Output, real B(N).  B(K) = C(K)/(K!), where
%    C(K) = number of partitions of a set of K objects.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  b(1) = 1.0;

  for l = 1 : n-1

    sum1 = 1.0 / l;
    for k = 1 : l-1
      sum1 = ( sum1 + b(k) ) / ( l - k );
    end

    b(l+1) = ( sum1 + b(l) ) / ( l + 1 );

  end

  m = n;
  npart = 0;

  while ( 1 )

    [ z, seed ] = r8_uniform_01 ( seed );
    z = m * b(m) * z;
    k = 0;
    npart = npart + 1;

    while ( 0.0 <= z )

      a(m) = npart;
      m = m - 1;

      if ( m == 0 )
        break
      end

      z = z - b(m);
      k = k + 1;
      z = z * k;

    end

    if ( m == 0 )
      break
    end

  end
%
%  Randomly permute the assignments.
%
  [ a, seed ] = perm_random2 ( n, a, seed );

  return
end
