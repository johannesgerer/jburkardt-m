function [ a, mult, npart, seed ] = i4_partition_random ( n, table, seed )

%*****************************************************************************80
%
%% I4_PARTITION_RANDOM selects a random partition of the integer N.
%
%  Discussion:
%
%    Note that some elements of the partition may be 0.  The partition is
%    returned as (MULT(I),I), with NPART nonzero entries in MULT, and
%
%      N = sum ( 1 <= I <= N ) MULT(I) * I.
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
%    Input, integer N, the integer to be partitioned.
%
%    Input, integer TABLE(N), the number of partitions of the integers 1 through N.
%    This table may be computed by I_PARTITION_COUNT2.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer A(N), contains in A(1:NPART) the parts of the partition.
%
%    Output, integer MULT(N), contains in MULT(1:NPART) the multiplicity
%    of the parts.
%
%    Output, integer NPART, the number of parts in the partition chosen,
%    that is, the number of integers I with nonzero multiplicity MULT(I).
%
%    Output, integer SEED, a seed for the random number generator.
%
  m = n;
  npart = 0;
  mult(1:n) = 0;

  while ( 0 < m )

    [ z, seed ] = r8_uniform_01 ( seed );
    z = m * table(m) * z;
    id = 1;
    i1 = m;
    j = 0;

    while ( 1 )

      j = j + 1;
      i1 = i1 - id;

      if ( i1 < 0 )
        id = id + 1;
        i1 = m;
        j = 0;
        continue
      end

      if ( i1 == 0 )
        z = z - id;
        if ( 0.0 < z )
          id = id + 1;
          i1 = m;
          j = 0;
          continue
        else
          break
        end
      end

      if ( 0 < i1 )
        z = z - id * table(i1);
        if ( z <= 0.0 )
          break
        end
      end

    end

    mult(id) = mult(id) + j;
    npart = npart + j;
    m = i1;

  end
%
%  Reformulate the partition in the standard form.
%  NPART is the number of distinct parts.
%
  npart = 0;

  for i = 1 : n
    if ( mult(i) ~= 0 )
      npart = npart + 1;
      a(npart) = i;
      mult(npart) = mult(i);
    end
  end

  mult(npart+1:n) = 0;

  return
end
