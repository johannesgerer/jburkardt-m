function value = i4_binomial_sample ( n, pp )

%*****************************************************************************80
%
%% I4_BINOMIAL_SAMPLE generates a binomial random deviate.
%
%  Discussion:
%
%    This procedure generates a single random deviate from a binomial
%    distribution whose number of trials is N and whose
%    probability of an event in each trial is P.
%
%    The previous version of this program relied on the assumption that
%    local memory would be preserved between calls.  It set up data
%    one time to be preserved for use over multiple calls.  In the
%    interests of portability, this assumption has been removed, and
%    the "setup" data is recomputed on every call.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2013
%
%  Author:
%
%    Original FORTRAN77 version by Barry Brown, James Lovato.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Voratas Kachitvichyanukul, Bruce Schmeiser,
%    Binomial Random Variate Generation,
%    Communications of the ACM,
%    Volume 31, Number 2, February 1988, pages 216-222.
%
%  Parameters:
%
%    Input, integer N, the number of binomial trials, from which a
%    random deviate will be generated.
%    0 < N.
%
%    Input, real PP, the probability of an event in each trial of
%    the binomial distribution from which a random deviate is to be generated.
%    0.0 < PP < 1.0.
%
%    Output, integer VALUE, a random deviate from the distribution.
%
  if ( pp <= 0.0 || 1.0 <= pp )
    fprintf ( 1, ' \n' );
    fprintf ( 1, 'I4_BINOMIAL_SAMPLE - Fatal error!\n' );
    fprintf ( 1, '  PP is out of range.\n' );
    error ( 'I4_BINOMIAL_SAMPLE - Fatal error!\n' );
  end

  p = min ( pp, 1.0 - pp );
  q = 1.0 - p;
  xnp = n * p;

  if ( xnp < 30.0 )

    qn = q ^ n;
    r = p / q;
    g = r * ( n + 1 );

    while ( 1 )

      ix = 0;
      f = qn;
      u = r8_uniform_01_sample ( );

      while ( 1 )

        if ( u < f )
          if ( 0.5 < pp )
            ix = n - ix;
          end
          value = ix;
          return
        end

        if ( 110 < ix )
          break
        end

        u = u - f;
        ix = ix + 1;
        f = f * ( g / ix - r );

      end

    end

  end
%
%  The calculation of this data was originally intended to be
%  done once, then saved for later calls.
%
  ffm = xnp + p;
  m = floor ( ffm );
  fm = m;
  xnpq = xnp * q;
  p1 = floor ( 2.195 * sqrt ( xnpq ) - 4.6 * q ) + 0.5;
  xm = fm + 0.5;
  xl = xm - p1;
  xr = xm + p1;
  c = 0.134 + 20.5 / ( 15.3 + fm );
  al = ( ffm - xl ) / ( ffm - xl * p );
  xll = al * ( 1.0 + 0.5 * al );
  al = ( xr - ffm ) / ( xr * q );
  xlr = al * ( 1.0 + 0.5 * al );
  p2 = p1 * ( 1.0 + c + c );
  p3 = p2 + c / xll;
  p4 = p3 + c / xlr;
%
%  Generate a variate.
%
  while ( 1 )

    u = r8_uniform_01_sample ( ) * p4;
    v = r8_uniform_01_sample ( );
%
%  Triangle
%
    if ( u < p1 )
      ix = floor ( xm - p1 * v + u );
      if ( 0.5 < pp )
        ix = n - ix;
      end
      value = ix;
      return
    end
%
%  Parallelogram
%
    if ( u <= p2 )

      x = xl + ( u - p1 ) / c;
      v = v * c + 1.0 - abs ( xm - x ) / p1;

      if ( v <= 0.0 || 1.0 < v )
        continue
      end

      ix = floor ( x );

    elseif ( u <= p3 )

      ix = floor ( xl + log ( v ) / xll );
      if ( ix < 0 )
        continue
      end
      v = v * ( u - p2 ) * xll;

    else

      ix = floor ( xr - log ( v ) / xlr );
      if ( n < ix )
        continue
      end
      v = v * ( u - p3 ) * xlr;

    end

    k = abs ( ix - m );

    if ( k <= 20 || xnpq / 2.0 - 1.0 <= k )

      f = 1.0;
      r = p / q;
      g = ( n + 1 ) * r;

      if ( m < ix )
        mp = m + 1;
        for i = mp : ix
          f = f * ( g / i - r );
        end
      elseif ( ix < m )
        ix1 = ix + 1;
        for i = ix1 : m
          f = f / ( g / i - r );
        end
      end

      if ( v <= f )
        if ( 0.5 < pp )
          ix = n - ix;
        end
        value = ix;
        return
      end

    else

      amaxp = ( k / xnpq ) * ( ( k * ( k / 3.0 ...
        + 0.625 ) + 0.1666666666666 ) / xnpq + 0.5 );
      ynorm = - ( k * k ) / ( 2.0 * xnpq );
      alv = log ( v );

      if ( alv < ynorm - amaxp )
        if ( 0.5 < pp )
          ix = n - ix;
        end
        value = ix;
        return
      end

      if ( ynorm + amaxp < alv )
        continue
      end

      x1 = ix + 1;
      f1 = fm + 1.0;
      z = n + 1 - fm;
      w = n - ix + 1;
      z2 = z * z;
      x2 = x1 * x1;
      f2 = f1 * f1;
      w2 = w * w;

      t = xm * log ( f1 / x1 ) + ( n - m + 0.5 ) * log ( z / w ) ...
        + real ( ix - m ) * log ( w * p / ( x1 * q )) ...
        + ( 13860.0 - ( 462.0 - ( 132.0 - ( 99.0 - 140.0 ...
        / f2 ) / f2 ) / f2 ) / f2 ) / f1 / 166320.0 ...
        + ( 13860.0 - ( 462.0 - ( 132.0 - ( 99.0 - 140.0 ...
        / z2 ) / z2 ) / z2 ) / z2 ) / z / 166320.0 ...
        + ( 13860.0 - ( 462.0 - ( 132.0 - ( 99.0 - 140.0 ...
        / x2 ) / x2 ) / x2 ) / x2 ) / x1 / 166320.0 ...
        + ( 13860.0 - ( 462.0 - ( 132.0 - ( 99.0 - 140.0 ...
        / w2 ) / w2 ) / w2 ) / w2 ) / w / 166320.0;

      if ( alv <= t )
        if ( 0.5 < pp )
          ix = n - ix;
        end
        value = ix;
        return
      end

    end

  end

  return
end
