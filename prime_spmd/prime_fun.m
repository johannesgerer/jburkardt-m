function total = prime_fun ( n )

%*****************************************************************************80
%
%% PRIME_FUN returns the number of primes between 1 and N.
%
%  Discussion:
%
%    This program uses MATLAB's SPMD ("single program, multiple data")
%    facility.
%
%    A naive algorithm is used.
%
%    Mathematica can return the number of primes less than or equal to N
%    by the command PrimePi[N].
%
%                N       TOTAL
%
%                1           0
%               10           4
%              100          25
%            1,000         168
%           10,000       1,229
%          100,000       9,592
%        1,000,000      78,498
%       10,000,000     664,579
%      100,000,000   5,761,455
%    1,000,000,000  50,847,534
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Input, integer N, the maximum number to check.
%
%  Output, integer TOTAL, the number of prime numbers up to N.
%
  spmd
%
%  Each worker figures out its portion of the range 2:N.
%
%  The first method chooses equal intervals.
%  The second method chooses roughly equal amounts of work.
%
    if ( 0 )
      nlo = ( n * ( labindex - 1 ) ) / numlabs + 1;
      nhi = ( n *   labindex       ) / numlabs;
    else
      nlo = floor ( ( n * sqrt ( labindex - 1 ) ) / sqrt ( numlabs ) ) + 1;
      nhi = floor ( ( n * sqrt ( labindex     ) ) / sqrt ( numlabs ) );
    end

    if ( nlo == 1 )
      nlo = 2;
    end

    fprintf ( 1, '  Range = [%d,%d]\n', nlo, nhi );
%
%  Each worker counts the number of primes in its range.
%
    total_part = 0;

    for i = nlo : nhi

      prime = 1;

      for j = 2 : i - 1
        if ( mod ( i, j ) == 0 )
          prime = 0;
          break
        end
      end

      total_part = total_part + prime;

    end
%
%  Sum the values on each worker.
%  The sum itself is also only on the workers, not on the client.
%
    total_spmd = gplus ( total_part );

  end
%
%  The client can retrieve the sum from one of the workers.
%
  total = total_spmd{1};

  return
end
