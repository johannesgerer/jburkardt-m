function [ nfactor, factor, power, mleft, nleft ] = rat_factor ( ...
  m, n, maxfactor )

%*****************************************************************************80
%
%% RAT_FACTOR factors a rational value into a product of prime factors.
%
%  Formula:
%
%    ( M / N ) = ( MLEFT / NLEFT ) * Product ( I = 1 to NFACTOR )
%      FACTOR(I)**POWER(I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 June 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the top and bottom of a rational value.
%    The ratio of M and N must be positive.
%
%    Input, integer MAXFACTOR, the maximum number of factors for
%    which storage has been allocated.
%
%    Output, integer NFACTOR, the number of prime factors of M/N.
%
%    Output, integer FACTOR(MAXFACTOR), the prime factors of M/N.
%
%    Output, integer POWER(MAXFACTOR).  POWER(I) is the power of
%    the FACTOR(I) in the representation of M/N.
%
%    Output, integer MLEFT, NLEFT, the top and bottom of the factor of
%    M / N that remains.  If ABS ( MLEFT / NLEFT ) is not 1, then
%    the rational value was not completely factored.
%
  nfactor = 0;

  mleft = m;
  nleft = n;
%
%  NLEFT should be nonnegative.
%
  if ( nleft < 0 )
    mleft = -mleft;
    nleft = -nleft;
  end

  if ( m == 0 | n == 0 )
    return
  end

  if ( m == n )
    nfactor = 1;
    factor(1) = 1;
    power(1) = 1;
    return
  end
%
%  Find out how many primes we stored.
%
  maxprime = prime ( -1 );

  for i = 1 : maxprime

    p = prime ( i );

    if ( mod ( nleft, p ) == 0 | mod ( abs ( mleft ), p ) == 0 )

      if ( nfactor < maxfactor )

        nfactor = nfactor + 1;
        factor(nfactor) = p;
        power(nfactor) = 0;
%
%  Divide MLEFT by PRIME(I) as often as you can.
%
        if ( mod ( abs ( mleft ), p ) == 0  )

          while ( 1 )

            power(nfactor) = power(nfactor) + 1;
            mleft = floor ( mleft / p );

            if ( mod ( abs ( mleft ), p ) ~= 0 )
              break
            end

          end

        end
%
%  Divide NLEFT by PRIME(I) as often as you can.
%
        if ( mod ( nleft, p ) == 0  )

          while ( 1 )

            power(nfactor) = power(nfactor) - 1;
            nleft = floor ( nleft / p );

            if ( mod ( nleft, p ) ~= 0 )
              break
            end

          end

        end

        if ( power(nfactor) == 0 )
          nfactor = nfactor - 1;
        end

      end

    end

  end

  return
end
