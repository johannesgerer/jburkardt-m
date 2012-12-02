function iprime = primer ( n )

%*****************************************************************************80
%
%% PRIMER computes the prime numbers up to a given limit.
%
%  Discussion:
%
%    PRIMER returns the results of its computations in the vector
%    IPRIME.  IPRIME(I) is -1 if the number I is not prime, and
%    1 if I is prime.
%
%    The algorithm is a simple-minded sieve of Eristothenes, with
%    no attempt at efficiency.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of IPRIME, and the maximum
%    value that will be considered.
%
%    Output, integer IPRIME(N), records the results for each integer.
%    IPRIME(I) = -1 if I is not prime, and IPRIME(I) = 1 if I is
%    prime.  By convention, IPRIME(1) will be set to -1.
%

%
%  IPRIME(I) = 0 means we don't know if I is prime.
%
  iprime(1:n) = 0;
%
%  By convention, 1 is not prime.
%
  iprime(1) = -1;
  next = 1;
%
%  Examine the integers in order.
%
  for next = 2 : n

    if ( iprime(next) == 0 )
      iprime(next) = 1;
      for i = 2 * next : next : n
        iprime(i) = -1;
      end
    end

  end

  return
end
