function [ value, ifault ] = prncst ( st, idf, d )

%*****************************************************************************80
%
%% PRNCST computes the lower tail of noncentral T distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by BE Cooper.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    BE Cooper,
%    Algorithm AS 5:
%    The Integral of the Non-Central T-Distribution,
%    Applied Statistics,
%    Volume 17, Number 2, 1968, page 193.
%
%  Parameters:
%
%    Input, real ST, the argument.
%
%    Input, integer IDF, the number of degrees of freedom.
%
%    Input, real D, the noncentrality parameter.
%
%    Output, real PRNCST, the value of the lower tail of
%    the noncentral T distribution.
%
%    Output, integer IFAULT, error flag.
%    0, no error occurred.
%    nonzero, an error occurred.
%
%  Local Parameters:
%
%    Local, real G1, 1.0 / sqrt(2.0 * pi)
%
%    Local, real G2, 1.0 / (2.0 * pi)
%
%    Local, real G3, sqrt(2.0 * pi)
%
  emin = 12.5;
  g1 = 0.3989422804;
  g2 = 0.1591549431;
  g3 = 2.5066282746;

  f = idf;
%
%  For very large IDF, use the normal approximation.
%
  if ( 100 < idf )

    ifault = 1;

    a = sqrt ( 0.5 * f ) * exp ( alngam ( 0.5 * ( f - 1.0 ) ) ...
    - alngam ( 0.5 * f ) ) * d;

    value = alnorm ( ( st - a ) / sqrt ( f * ( 1.0 + d * d ) ...
    / ( f - 2.0 ) - a * a ), 0 );

    return
  end

  ifault = 0;
  ioe = mod ( idf, 2 );
  a = st / sqrt ( f );
  b = f / ( f + st * st );
  rb = sqrt ( b );
  da = d * a;
  drb = d * rb;

  if ( idf == 1 )
    value = alnorm ( drb, 1 ) + 2.0 * tfn ( drb, a );
    return
  end

  sum = 0.0;

  if ( abs ( drb ) < emin )
    fmkm2 = a * rb * exp ( - 0.5 * drb * drb ) * alnorm ( a * drb, 0 ) * g1;
  else
    fmkm2 = 0.0;
  end

  fmkm1 = b * da * fmkm2;

  if ( abs ( d ) < emin )
    fmkm1 = fmkm1 + b * a * g2 * exp ( - 0.5 * d * d );
  end

  if ( ioe == 0 )
    sum = fmkm2;
  else
    sum = fmkm1;
  end

  ak = 1.0;
  fk = 2.0;

  for k = 2 : 2 : idf - 2

    fkm1 = fk - 1.0;
    fmkm2 = b * ( da * ak * fmkm1 + fmkm2 ) * fkm1 / fk;
    ak = 1.0 / ( ak * fkm1 );
    fmkm1 = b * ( da * ak * fmkm2 + fmkm1 ) * fk / ( fk + 1.0 );

    if ( ioe == 0 )
      sum = sum + fmkm2;
    else
      sum = sum + fmkm1;
    end

    ak = 1.0 / ( ak * fk );
    fk = fk + 2.0;

  end

  if ( ioe == 0 )
    value = alnorm ( d, 1 ) + sum * g3;
  else
    value = alnorm ( drb, 1 ) + 2.0 * ( sum + tfn ( drb, a ) );
  end

  return
end
