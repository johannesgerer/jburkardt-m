function [ value, ifault ] = chyper ( point, kk, ll, mm, nn )

%*****************************************************************************80
%
%% CHYPER computes point or cumulative hypergeometric probabilities.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by Richard Lund.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    PR Freeman,
%    Algorithm AS 59:
%    Hypergeometric Probabilities,
%    Applied Statistics,
%    Volume 22, Number 1, 1973, pages 130-133.
%
%    Richard Lund,
%    Algorithm AS 152:
%    Cumulative hypergeometric probabilities,
%    Applied Statistics,
%    Volume 29, Number 2, 1980, pages 221-223.
%
%    BL Shea,
%    Remark AS R77:
%    A Remark on Algorithm AS 152: Cumulative hypergeometric probabilities,
%    Applied Statistics,
%    Volume 38, Number 1, 1989, pages 199-204.
%
%  Parameters:
%
%    Input, logical POINT, is TRUE if the point probability is desired,
%    and FALSE if the cumulative probability is desired.
%
%    Input, integer KK, the sample size.
%    0 <= KK <= MM.
%
%    Input, integer LL, the number of successes in the sample.
%    0 <= LL <= KK.
%
%    Input, integer MM, the population size that was sampled.
%    0 <= MM.
%
%    Input, integer NN, the number of "successes" in the population.
%    0 <= NN <= MM.
%
%    Output, real VALUE, the PDF (point probability) of
%    exactly LL successes out of KK samples, or the CDF (cumulative
%    probability) of up to LL successes out of KK samples.
%
%    Output, integer IFAULT, error flag.
%    0, no error occurred.
%    nonzero, an error occurred.
%
  elimit = - 88.0;
  mbig = 600;
  mvbig = 1000;
  rootpi = 2.506628274631001;
  scale = 1.0E+35;

  ifault = 0;

  k = kk + 1;
  l = ll + 1;
  m = mm + 1;
  n = nn + 1;

  dir = 1;
%
%  Check arguments are within permitted limits.
%
  value = 0.0;

  if ( n < 1 | m < n | k < 1 | m < k )
    ifault = 1;
    return
  end

  if ( l < 1 | m - n < k - l )
    ifault = 2;
    return
  end

  if ( ~point )
    value = 1.0;
  end

  if ( n < l | k < l )
    ifault = 2;
    return
  end

  ifault = 0;
  value = 1.0;

  if ( k == 1 | k == m | n == 1 | n == m )
    return
  end

  if ( ~point & ll == min ( kk, nn ) )
    return
  end

  p = nn / ( mm - nn );

  if ( 16.0 * max ( p, 1.0 / p ) < min ( kk, mm - kk )  & ...
    mvbig < mm & - 100.0 < elimit )
%
%  Use a normal approximation.
%
    mean = kk * nn / mm;

    sig = sqrt ( mean * ( ( mm - nn ) / mm ) ...
    * ( ( mm - kk ) / ( mm - 1 ) ) );

    if ( point )

      arg = - 0.5 * ( ( ( ll - mean ) / sig )^2 );
      if ( elimit <= arg )
        value = exp ( arg ) / ( sig * rootpi );
      else
        value = 0.0;
      end

    else

      value = alnorm ( ( ll + 0.5 - mean ) / sig, 0 );

    end

  else
%
%  Calculate exact hypergeometric probabilities.
%  Interchange K and N if this saves calculations.
%
    if ( min ( n - 1, m - n ) < min ( k - 1, m - k ) )
      i = k;
      k = n;
      n = i;
    end

    if ( m - k < k - 1 )
      dir = ~dir;
      l = n - l + 1;
      k = m - k + 1;
    end

    if ( mbig < mm )
%
%  Take logarithms of factorials.
%
      p = alnfac ( nn ) ...
        - alnfac ( mm ) ...
        + alnfac ( mm - kk ) ...
        + alnfac ( kk ) ...
        + alnfac ( mm - nn ) ...
        - alnfac ( ll ) ...
        - alnfac ( nn - ll ) ...
        - alnfac ( kk - ll ) ...
        - alnfac ( mm - nn - kk + ll );

      if ( elimit <= p )
        value = exp ( p );
      else
        value = 0.0;
      end

    else
%
%  Use Freeman/Lund algorithm.
%
      for i = 1 : l - 1
        value = value * ( k - i ) * ( n - i ) / ( l - i ) / ( m - i );
      end

      if ( l ~= k )
        j = m - n + l;
        for i = l : k - 1
          value = value * ( j - i ) / ( m - i );
        end

      end

    end

    if ( point )
      return
    end

    if ( value == 0.0 )
%
%  We must recompute the point probability since it has underflowed.
%
      if ( mm <= mbig )
        p = alnfac ( nn ) ...
          - alnfac ( mm ) ...
          + alnfac ( kk ) ...
          + alnfac ( mm - nn ) ...
          - alnfac ( ll ) ...
          - alnfac ( nn - ll ) ...
          - alnfac ( kk - ll ) ...
          - alnfac ( mm - nn - kk + ll ) ...
          + alnfac ( mm - kk );
      end

      p = p + log ( scale );

      if ( p < elimit )
        ifault = 3;
        if ( ( nn * kk + nn + kk + 1 ) / ( mm + 2 ) < ll );
          value = 1.0;
        end
        return
      else
        p = exp ( p );
      end

    else
%
%  Scale up at this point.
%
      p = value * scale;

    end

    pt = 0.0;
    nl = n - l;
    kl = k - l;
    mnkl = m - n - kl + 1;

    if ( l <= kl )

      for i = 1 : l - 1
        p = p * ( l - i ) * ( mnkl - i ) / ( nl + i ) / ( kl + i );
        pt = pt + p;
      end

    else

      dir = ~dir;
      for j = 0 : kl - 1
        p = p * ( nl - j ) * ( kl - j ) / ( l + j ) / ( mnkl + j );
        pt = pt + p;
      end

    end

    if ( p == 0.0 )
      ifault = 3;
    end

    if ( dir )
      value = value + ( pt / scale );
    else
      value = 1.0 - ( pt / scale );
    end

  end

  return
end
