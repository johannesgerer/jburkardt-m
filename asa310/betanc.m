function [ value, ifault ] = betanc ( x, a, b, lambda )

%*****************************************************************************80
%
%% BETANC computes the tail of the noncentral Beta distribution.
%
%  Discussion:
%
%    This routine returns the cumulative probability of X for the non-central
%    Beta distribution with parameters A, B and non-centrality LAMBDA.
%
%    Note that if LAMBDA = 0, the standard Beta distribution is defined.
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
%    Algorithm AS 226:
%    Computing Noncentral Beta Probabilities,
%    Applied Statistics,
%    Volume 36, Number 2, 1987, pages 241-244.
%
%    H Frick,
%    Algorithm AS R84:
%    A Remark on Algorithm AS 226:
%    Computing Noncentral Beta Probabilities,
%    Applied Statistics,
%    Volume 39, Number 2, 1990, pages 311-312.
%
%  Parameters:
%
%    Input, real X, the value defining the cumulative
%    probability lower tail.  Normally, 0 <= X <= 1, but any value
%    is allowed.
%
%    Input, real A, B, the parameters of the distribution.
%    0 < A, 0 < B.
%
%    Input, real LAMBDA, the noncentrality parameter
%    of the distribution.  0 <= LAMBDA.  The program can produce reasonably
%    accurate results for values of LAMBDA up to about 100.
%
%    Output, real VALUE, the cumulative probability
%    of X.
%
%    Output, integer IFAULT, error flag.
%    0, no error occurred.
%    nonzero, an error occurred.
%
  errmax = 1.0E-07;
  itrmax = 150;
  ualpha = 5.0;

  ifault = 0;

  if ( lambda < 0.0 | a <= 0.0 | b <= 0.0 )
    ifault = 2;
    value = -1.0;
    return
  end

  if ( x <= 0.0 )
    value = 0.0;
    return
  end

  if ( 1.0 <= x )
    value = 1.0;
    return
  end

  c = 0.5 * lambda;
%
%  Initialize the series.
%
  beta = alngam ( a ) ...
       + alngam ( b ) ...
       - alngam ( a + b );

  temp = betain ( x, a, b, beta );

  gx = exp ( a * log ( x ) + b * log ( 1.0 - x ) - beta - log ( a ) );

  q = exp ( - c );

  xj = 0.0;
  ax = q * temp;
  sumq = 1.0 - q;
  value = ax;
%
%  Recur over subsequent terms until convergence is achieved.
%
  ifault = 1;

  while ( 1 )

    xj = xj + 1.0;
    temp = temp - gx;
    gx = x * ( a + b + xj - 1.0 ) * gx / ( a + xj );
    q = q * c / xj;
    sumq = sumq - q;
    ax = temp * q;
    value = value + ax;
%
%  Check for convergence and act accordingly.
%
    errbd = abs ( ( temp - gx ) * sumq );

    if ( errbd <= errmax )
      ifault = 0;
      break
    end

    if (  itrmax < xj )
      break
    end

  end

  return
end
