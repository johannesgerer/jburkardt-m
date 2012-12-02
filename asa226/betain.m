function [ value, ifault ] = betain ( x, p, q, beta )

%*****************************************************************************80
%
%% BETAIN computes the incomplete Beta function ratio.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by KL Majumder, GP Bhattacharjee.
%    FORTRAN90 version by John Burkardt.
%
%  Reference:
%
%    KL Majumder, GP Bhattacharjee,
%    Algorithm AS 63:
%    The incomplete Beta Integral,
%    Applied Statistics,
%    Volume 22, Number 3, 1973, pages 409-411.
%
%  Parameters:
%
%    Input, real X, the argument, between 0 and 1.
%
%    Input, real P, Q, the parameters, which
%    must be positive.
%
%    Input, real BETA, the logarithm of the complete
%    beta function.
%
%    Output, real BETAIN, the value of the incomplete
%    Beta function ratio.
%
%    Output, integer IFAULT, error flag.
%    0, no error.
%    nonzero, an error occurred.
%
  acu = 0.1D-14;

  value = x;
  ifault = 0;
%
%  Check the input arguments.
%
  if ( p <= 0.0 | q <= 0.0 )
    ifault = 1;
    return
  end

  if ( x < 0.0 | 1.0 < x )
    ifault = 2;
    return
  end
%
%  Special cases.
%
  if ( x == 0.0 | x == 1.0 )
    return
  end
%
%  Change tail if necessary and determine S.
%
  psq = p + q;
  cx = 1.0 - x;

  if ( p < psq * x )
    xx = cx;
    cx = x;
    pp = q;
    qq = p;
    indx = 1;
  else
    xx = x;
    pp = p;
    qq = q;
    indx = 0;
  end

  term = 1.0;
  ai = 1.0;
  value = 1.0;
  ns = floor ( qq + cx * psq );
%
%  Use the Soper reduction formula.
%
  rx = xx / cx;
  temp = qq - ai;
  if ( ns == 0 )
    rx = xx;
  end

  while ( 1 )

    term = term * temp * rx / ( pp + ai );
    value = value + term;
    temp = abs ( term );

    if ( temp <= acu & temp <= acu * value )

      value = value * exp ( pp * log ( xx ) ...
      + ( qq - 1.0 ) * log ( cx ) - beta ) / pp;

      if ( indx )
        value = 1.0 - value;
      end

      break

    end

    ai = ai + 1.0;
    ns = ns - 1;

    if ( 0 <= ns )
      temp = qq - ai;
      if ( ns == 0 )
        rx = xx;
      end
    else
      temp = psq;
      psq = psq + 1.0;
    end

  end

  return
end
