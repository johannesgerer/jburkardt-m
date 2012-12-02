function value = bivnor ( ah, ak, r )

%*****************************************************************************80
%
%% BIVNOR computes the bivariate normal CDF.
%
%  Discussion:
%
%    BIVNOR computes the probability for two normal variates X and Y
%    whose correlation is R, that AH <= X and AK <= Y.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2012
%
%  Author:
%
%    Original FORTRAN77 version by Thomas Donnelly.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Thomas Donnelly,
%    Algorithm 462: Bivariate Normal Distribution,
%    Communications of the ACM,
%    October 1973, Volume 16, Number 10, page 638.
%
%  Parameters:
%
%    Input, real AH, AK, the lower limits of integration.
%
%    Input, real R, the correlation between X and Y.
%
%    Output, real VALUE, the bivariate normal CDF.
%
%  Local Parameters:
%
%    Local, integer IDIG, the number of significant digits
%    to the right of the decimal point desired in the answer.
%
  idig = 15;
  b = 0.0;

  gh = gauss ( - ah ) / 2.0;
  gk = gauss ( - ak ) / 2.0;

  if ( r == 0.0 )
    b = 4.00 * gh * gk;
    b = max ( b, 0.0 );
    b = min ( b, 1.0 );
    value = b;
    return
  end

  rr = ( 1.0 + r ) * ( 1.0 - r );

  if ( rr < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BIVNOR - Fatal error!\n' );
    fprintf ( 1, '  1 < |R|.\n' );
    error ( 'BIVNOR - Fatal error!' );
  end

  if ( rr == 0.0 )

    if ( r < 0.0 )

      if ( ah + ak < 0.0 )
        b = 2.0 * ( gh + gk ) - 1.0;
      end

    else

      if ( ah - ak < 0.0 )
        b = 2.0 * gk;
      else
        b = 2.0 * gh;
      end

    end

    b = max ( b, 0.0 );
    b = min ( b, 1.0 );
    value = b;
    return

  end

  sqr = sqrt ( rr );

  if ( idig == 15 )
    con = 2.0 * pi * 1.0E-15 / 2.0;
  else
    con = pi;
    for i = 1 : idig
      con = con / 10.0;
    end
  end
%
%  (0,0)
%
  if ( ah == 0.0 && ak == 0.0 )
    b = 0.25 + 0.5 * asin ( r ) / pi;
    b = max ( b, 0.0 );
    b = min ( b, 1.0 );
    value = b;
    return
  end
%
%  (0,nonzero)
%
  if ( ah == 0.0 && ak ~= 0.0 )

    b = gk;
    wh = -ak;
    wk = ( ah / ak - r ) / sqr;
    gw = 2.0 * gk;
    is = 1;
%
%  (nonzero,0)
%
  elseif ( ah ~= 0.0 && ak == 0.0 )

    b = gh;
    wh = -ah;
    wk = ( ak / ah - r ) / sqr;
    gw = 2.0 * gh;
    is = -1;
%
%  (nonzero,nonzero)
%
  elseif ( ah ~= 0.0 && ak ~= 0.0 )

    b = gh + gk;
    if ( ah * ak < 0.0 )
      b = b - 0.5;
    end
    wh = - ah;
    wk = ( ak / ah - r ) / sqr;
    gw = 2.0 * gh;
    is = -1;

  end

  while ( 1 )

    sgn = -1.0;
    t = 0.0;

    if ( wk ~= 0.0 )

      if ( abs ( wk ) == 1.0 )

        t = wk * gw * ( 1.0 - gw ) / 2.0;
        b = b + sgn * t;

      else

        if ( 1.0 < abs ( wk ) )

          sgn = -sgn;
          wh = wh * wk;
          g2 = gauss ( wh );
          wk = 1.0 / wk;

          if ( wk < 0.0 )
            b = b + 0.5;
          end

          b = b - ( gw + g2 ) / 2.0 + gw * g2;

        end

        h2 = wh * wh;
        a2 = wk * wk;
        h4 = h2 / 2.0;
        ex = exp ( - h4 );
        w2 = h4 * ex;
        ap = 1.0;
        s2 = ap - ex;
        sp = ap;
        s1 = 0.0;
        sn = s1;
        conex = abs ( con / wk );

        while ( 1 )

          cn = ap * s2 / ( sn + sp );
          s1 = s1 + cn;

          if ( abs ( cn ) <= conex )
            break
          end

          sn = sp;
          sp = sp + 1.0;
          s2 = s2 - w2;
          w2 = w2 * h4 / sp;
          ap = - ap * a2;

        end

        t = 0.5 * ( atan ( wk ) - wk * s1 ) / pi;
        b = b + sgn * t;

      end

    end

    if ( 0 <= is )
      break
    end

    if ( ak == 0.0 )
      break
    end

    wh = -ak;
    wk = ( ah / ak - r ) / sqr;
    gw = 2.0 * gk;
    is = 1;

  end

  b = max ( b, 0.0 );
  b = min ( b, 1.0 );
  value = b;

  return
end
function value = gauss ( t )

%*****************************************************************************80
%
%% GAUSS is a univariate lower normal tail area.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2012
%
%  Author:
%
%    Original FORTRAN77 version by Thomas Donnelly.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Thomas Donnelly,
%    Algorithm 462: Bivariate Normal Distribution,
%    Communications of the ACM,
%    October 1973, Volume 16, Number 10, page 638.
%
%  Parameters:
%
%    Input, real T, the evaluation point.
%
%    Output, real VALUE, the area of the lower tail of the normal PDF
%    from -oo to T.
%
  value = ( 1.0 + erf ( t / sqrt ( 2.0 ) ) ) / 2.0;

  return
end
