function [ prob, ier ] = mdbeta ( x, p, q )

%% MDBETA evaluates the incomplete beta function.
%
%  Modified:
%
%    30 January 2008
%
%  Author:
%
%    Original FORTRAN77 version by Oliver Ludwig;
%    MATLAB version by John Burkardt
%
%  Reference:
%
%    Oliver Ludwig,
%    Algorithm 179:
%    Incomplete Beta Ratio,
%    Communications of the ACM,
%    Volume 6, Number 6, June 1963, page 314.
%
%  Parameters:
%
%    Input, real X, the value to which function is to be
%    integrated.  X must be in the range [0,1] inclusive.
%
%    Input, real P, the first parameter.  P must be greater
%    than 0.0.
%
%    Input, real Q, the second parameter.  Q must be greater
%    than 0.0.
%
%    Output, real PROB.  The probability that a random variable
%    from a Beta distribution having parameters P and Q will be less than
%    or equal to X.
%
%    Output, integer IER, error parameter.
%    0, normal exit.
%    1, X is not in the range [0,1] inclusive.
%    2, P or Q is less than or equal to 0.
%
%  Local parameters:
%
%    Local, real ALEPS, the logarithm of EPS1.
%
%    Local, real EPS, the machine precision.
%
%    Local, real EPS1, the smallest representable number.
%
  aleps = - 179.6016;
  eps = 2.2E-16;
  eps1 = 1.0E-78;
%
%  Check ranges of the arguments.
%
  prob = 0.0;
  y = x;

  if ( x < 0.0 || 1.0 < x )
    ier = 1;
    return
  end

  if ( p <= 0.0 || q <= 0.0 )
    ier = 2;
    return
  end

  ier = 0;

  if ( x <= 0.5 )
    interval = 0;
  else
    interval = 1;
    temp = p;
    p = q;
    q = temp;
    y = 1.0 - y;
  end

  if ( x == 0.0 || x == 1.0 )

    prob = 0.0;

    if ( interval ~= 0 )
      prob = 1.0 - prob;
      temp = p;
      p = q;
      q = temp;
    end

    return
  end

  ib = q;
  temp = ib;
  ps = q - ib;

  if ( q == temp )
    ps = 1.0;
  end

  dp = p;
  dq = q;
  px = dp * log ( y );
  pq = alogam ( dp + dq );
  p1 = alogam ( dp );
  c = alogam ( dq );
  d4 = log ( dp );
  xb = px + alogam ( ps + dp ) - alogam ( ps ) - d4 - p1;
%
%  Scaling
%
  ib = floor ( xb / aleps );
  infsum = 0.0;
%
%  First term of a decreasing series will underflow.
%
  if ( ib == 0 )

    infsum = exp ( xb );
    cnt = infsum * dp;
%
%  CNT will equal dexp ( temp ) * ( 1.d0 - ps ) * i * p * y**i / factorial ( i ).
%
    wh = 0.0;

    while ( 1 )

      wh = wh + 1.0;
      cnt = cnt * ( wh - ps ) * y / wh;
      xb = cnt / ( dp + wh );
      infsum = infsum + xb;

      if ( xb / eps < infsum )
        break
      end

    end

  end

  finsum = 0.0;

  if ( dq <= 1.0 )

    prob = finsum + infsum;

    if ( interval ~= 0 )
      prob = 1.0 - prob;
      temp = p;
      p = q;
      q = temp;
    end

    return
  end

  xb = px + dq * log ( 1.0 - y ) + pq - p1 - log ( dq ) - c;
%
%  Scaling.
%
  ib = floor ( xb / aleps );

  if ( ib < 0 )
    ib = 0;
  end

  c = 1.0 / ( 1.0 - y );
  cnt = exp ( xb - ib * aleps );
  ps = dq;
  wh = dq;

  while ( 1 )

    wh = wh - 1.0;

    if ( wh <= 0.0 )

      prob = finsum + infsum;

      if ( interval ~= 0 )
        prob = 1.0 - prob;
        temp = p;
        p = q;
        q = temp;
      end

      break

    end

    px = ( ps * c ) / ( dp + wh );

    if ( px <= 1.0 )

      if ( cnt / eps <= finsum || cnt <= eps1 / px )

        prob = finsum + infsum;

        if ( interval ~= 0 )
          prob = 1.0 - prob;
          temp = p;
          p = q;
          q = temp;
        end

        break

      end

    end

    cnt = cnt * px;
%
%  Rescale.
%
    if ( 1.0 < cnt )
      ib = ib - 1;
      cnt = cnt * eps1;
    end

    ps = wh;

    if ( ib == 0 )
      finsum = finsum + cnt;
    end

  end

  return
end
