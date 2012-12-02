function total = prime_fun ( n )

%*****************************************************************************80
%
%% PRIME_FUN returns the number of primes between 1 and N.
%
%  Discussion:
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
%    22 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Input, integer N, the maximum number to check.
%
%  Output, integer TOTAL, the number of prime numbers up to N.
%
  total = 0;

  parfor i = 2 : n

    prime = 1;
%
%  Using sqrt ( i ) or i - 1 for the upper limit makes a huge difference
%  in timing for large problems.
%
    for j = 2 : sqrt ( i )
      if ( mod ( i, j ) == 0 )
        prime = 0;
        break
      end
    end

    total = total + prime;

  end

  return
end
