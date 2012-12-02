function [ value, ifault ] = xinbta ( p, q, beta, alpha )

%*****************************************************************************80
%
%% XINBTA computes inverse of the incomplete Beta function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    Original FORTRAN77 version by GW Cran, KJ Martin, GE Thomas.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    GW Cran, KJ Martin, GE Thomas,
%    Remark AS R19 and Algorithm AS 109:
%    A Remark on Algorithms AS 63: The Incomplete Beta Integral
%    and AS 64: Inverse of the Incomplete Beta Integeral,
%    Applied Statistics,
%    Volume 26, Number 1, 1977, pages 111-114.
%
%  Parameters:
%
%    Input, real P, Q, the parameters of the incomplete
%    Beta function.
%
%    Input, real BETA, the logarithm of the value of
%    the complete Beta function.
%
%    Input, real ALPHA, the value of the incomplete Beta
%    function.  0 <= ALPHA <= 1.
%
%    Output, real VALUE, the argument of the incomplete
%    Beta function which produces the value ALPHA.
%
%    Output, integer IFAULT, error flag.
%    0, no error occurred.
%    nonzero, an error occurred.
%
%  Local Parameters:
%
%    Local, real ( kind = 8 ) SAE, the most negative decimal exponent
%    which does not cause an underflow.
%
  sae = -37.0;

  fpu = 10.0^sae;

  ifault = 0;
  value = alpha;
%
%  Test for admissibility of parameters.
%
  if ( p <= 0.0 || q <= 0.0 )
    ifault = 1;
    return
  end

  if ( alpha < 0.0 || 1.0 < alpha )
    ifault = 2;
    return
  end

  if ( alpha == 0.0 || alpha == 1.0 )
    return
  end
%
%  Change tail if necessary.
%
  if ( 0.5 < alpha )
    a = 1.0 - alpha;
    pp = q;
    qq = p;
    indx = 1;
  else
    a = alpha;
    pp = p;
    qq = q;
    indx = 0;
  end
%
%  Calculate the initial approximation.
%
  r = sqrt ( - log ( a * a ) );

  y = r - ( 2.30753 + 0.27061 * r ) ...
    / ( 1.0 + ( 0.99229 + 0.04481 * r ) * r );

  if ( 1.0 < pp & 1.0 < qq )

    r = ( y * y - 3.0 ) / 6.0;
    s = 1.0 / ( pp + pp - 1.0 );
    t = 1.0 / ( qq + qq - 1.0 );
    h = 2.0 / ( s + t );
    w = y * sqrt ( h + r ) / h - ( t - s ) ...
      * ( r + 5.0 / 6.0 - 2.0 / ( 3.0 * h ) );
    value = pp / ( pp + qq * exp ( w + w ) );

  else

    r = qq + qq;
    t = 1.0 / ( 9.0 * qq );
    t = r * ( 1.0 - t + y * sqrt ( t ) )^3;

    if ( t <= 0.0 )
      value = 1.0 - exp ( ( log ( ( 1.0 - a ) * qq ) + beta ) / qq );
    else

      t = ( 4.0 * pp + r - 2.0 ) / t;

      if ( t <= 1.0 )
        value = exp ( ( log ( a * pp ) + beta ) / pp );
      else
        value = 1.0 - 2.0 / ( t + 1.0 );
      end

    end

  end
%
%  Solve for X by a modified Newton-Raphson method,
%  using the function BETAIN.
%
  r = 1.0 - pp;
  t = 1.0 - qq;
  yprev = 0.0;
  sq = 1.0;
  prev = 1.0;

  if ( value < 0.0001 )
    value = 0.0001;
  end

  if ( 0.9999 < value )
    value = 0.9999;
  end

  iex = max ( - 5.0 / pp / pp - 1.0 / a^0.2 - 13.0, sae );

  acu = 10.0^iex;

  while ( 1 )

    [ y, ifault ] = betain ( value, pp, qq, beta );

    if ( ifault ~= 0 )
      ifault = 3;
      return
    end

    xin = value;
    y = ( y - a ) * exp ( beta + r * log ( xin ) + t * log ( 1.0 - xin ) );

    if ( y * yprev <= 0.0 )
      prev = max ( sq, fpu );
    end

    g = 1.0;

    while ( 1 )

      while ( 1 )

        adj = g * y;
        sq = adj * adj;

        if ( sq < prev )

          tx = value - adj;

          if ( 0.0 <= tx & tx <= 1.0 )
            break
          end

        end

        g = g / 3.0;

      end

      if ( prev <= acu )
        if ( indx )
          value = 1.0 - value;
        end
        return
      end

      if ( y * y <= acu )
        if ( indx )
          value = 1.0 - value;
        end
        return
      end

      if ( tx ~= 0.0 & tx ~= 1.0 )
        break
      end

      g = g / 3.0;

    end

    if ( tx == value )
      break
    end

    value = tx;
    yprev = y;

  end

  if ( indx )
    value = 1.0 - value;
  end

  return
end
