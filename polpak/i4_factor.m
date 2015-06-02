function [ nfactor, factor, power, nleft ] = i4_factor ( n )

%*****************************************************************************80
%
%% I4_FACTOR factors an integer into prime factors.
%
%  Formula:
%
%    N = NLEFT * Product ( 1 <= I <= NFACTOR ) FACTOR(I)^POWER(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the integer to be factored.  N may be positive,
%    negative, or 0.
%
%    Output, integer NFACTOR, the number of prime factors of N discovered
%    by the routine.
%
%    Output, integer FACTOR(NFACTOR), the prime factors of N.
%
%    Output, integer POWER(NFACTOR).  POWER(I) is the power of
%    the FACTOR(I) in the representation of N.
%
%    Output, integer NLEFT, the factor of N that the routine could not
%    divide out.  If NLEFT is 1, then N has been completely factored.
%    Otherwise, NLEFT represents factors of N involving large primes.
%
  nfactor = 0;

  factor = [];
  power = [];

  nleft = n;

  if ( n == 0 )
    return
  end

  if ( abs ( n ) == 1 )
    nfactor = 1;
    factor(1) = 1;
    power(1) = 1;
    return;
  end
%
%  Find out how many primes we stored.
%
  maxprime = prime ( -1 );
%
%  Try dividing the remainder by each prime.
%
  for i = 1 : maxprime

    p = prime ( i );

    if ( mod ( abs ( nleft ), p ) == 0 )

      nfactor = nfactor + 1;
      factor(nfactor) = p;
      power(nfactor) = 0;

      while ( 1 )

        power(nfactor) = power(nfactor) + 1;
        nleft = floor ( nleft / p );

        if ( mod ( abs ( nleft ), p ) ~= 0 ) 
          break;
        end

      end

      if ( abs ( nleft ) == 1 )
        break;
      end

    end

  end

  return
end
