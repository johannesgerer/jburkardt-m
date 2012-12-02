function [ value, ifault ] = tnc ( t, df, delta )

%*****************************************************************************80
%
%% TNC computes the tail of the noncentral T distribution.
%
%  Discussion:
%
%    This routine computes the cumulative probability at T of the
%    non-central T-distribution with DF degrees of freedom (which may
%    be fractional) and non-centrality parameter DELTA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by Russell Lenth.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Russell Lenth,
%    Algorithm AS 243:
%    Cumulative Distribution Function of the Non-Central T Distribution,
%    Applied Statistics,
%    Volume 38, Number 1, 1989, pages 185-189.
%
%    William Guenther,
%    Evaluation of probabilities for the noncentral distributions and
%    difference of two T-variables with a desk calculator,
%    Journal of Statistical Computation and Simulation,
%    Volume 6, Number 3-4, 1978, pages 199-206.
%
%  Parameters:
%
%    Input, real T, the point whose cumulative probability
%    is desired.
%
%    Input, real DF, the number of degrees of freedom.
%
%    Input, real DELTA, the noncentrality parameter.
%
%    Output, real VALUE, the tail of the noncentral
%    T distribution.
%
%    Output, integer IFAULT, error flag.
%    0, no error.
%    nonzero, an error occcurred.
%
  alnrpi = 0.57236494292470008707;
  errmax = 1.0E-10;
  itrmax = 100;
  r2pi = 0.79788456080286535588;

  value = 0.0;

  if ( df <= 0.0 )
    ifault = 2;
    return
  end

  ifault = 0;

  tt = t;
  del = delta;
  negdel = 0;

  if ( t < 0.0 )
    negdel = 1;
    tt = - tt;
    del = - del;
  end
%
%  Initialize twin series.
%
  en = 1.0;
  x = t * t / ( t * t + df );

  if ( x <= 0.0 )

    ifault = 0;
    value = value + alnorm ( del, 1 );

    if ( negdel )
      value = 1.0 - value;
    end

    return

  end

  lambda = del * del;
  p = 0.5 * exp ( - 0.5 * lambda );
  q = r2pi * p * del;
  s = 0.5 - p;
  a = 0.5;
  b = 0.5 * df;
  rxb = ( 1.0 - x )^b;
  albeta = alnrpi + alngam ( b ) - alngam ( a + b );
  xodd = betain ( x, a, b, albeta );
  godd = 2.0 * rxb * exp ( a * log ( x ) - albeta );
  xeven = 1.0 - rxb;
  geven = b * x * rxb;
  value = p * xodd + q * xeven;
%
%  Repeat until convergence.
%
  while ( 1 )

    a = a + 1.0;
    xodd = xodd - godd;
    xeven = xeven - geven;
    godd = godd * x * ( a + b - 1.0 ) / a;
    geven = geven * x * ( a + b - 0.5 ) / ( a + 0.5 );
    p = p * lambda / ( 2.0 * en );
    q = q * lambda / ( 2.0 * en + 1.0 );
    s = s - p;
    en = en + 1.0;
    value = value + p * xodd + q * xeven;
    errbd = 2.0 * s * ( xodd - godd );

    if ( errbd <= errmax )
      ifault = 0;
      break
    end

    if ( itrmax < en )
      ifault = 1;
      break
    end

  end

  value = value + alnorm ( del, 1 );

  if ( negdel )
    value = 1.0 - value;
  end

  return
end
