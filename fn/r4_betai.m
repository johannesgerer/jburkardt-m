function value = r4_betai ( x, pin, qin )

%*****************************************************************************80
%
%% R4_BETAI evaluates the incomplete beta ratio of R8 arguments.
%
%  Discussion:
%
%    The incomplete Beta function ratio is the probability that a
%    random variable from a beta distribution having parameters
%    P and Q will be less than or equal to X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Nancy Bosten, EL Battiste,
%    Remark on Algorithm 179:
%    Incomplete Beta Ratio,
%    Communications of the ACM,
%    Volume 17, Number 3, March 1974, pages 156-157.
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real X, the upper limit of integration.
%    0.0 <= X <= 1.0.
%
%    Input, real PIN, the first distribution parameter.
%    0.0 < PIN.
%
%    Input, real QIN, the second distribution parameter.
%    0.0 < QIN.
%
%    Output, real VALUE, the incomplete beta function ratio.
%
  persistent alneps
  persistent alnsml
  persistent eps
  persistent sml

  if ( isempty ( eps ) )
    eps = r4_mach ( 3 );
    alneps = log ( eps );
    sml = r4_mach ( 1 );
    alnsml = log ( sml );
  end

  if ( x < 0.0 || 1.0 < x )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BETAI - Fatal error!\n' );
    fprintf ( 1, '  0 <= X <= 1 is required.\n' );
    error ( 'R4_BETAI - Fatal error!' )
  end

  if ( pin <= 0.0 || qin <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BETAI - Fatal error!\n' );
    fprintf ( 1, '  P or Q <= 0.0.\n' );
    error ( 'R4_BETAI - Fatal error!' )
  end

  y = x;
  p = pin;
  q = qin;

  if ( p < q || 0.8 <= x )

    if ( 0.2 <= x )
      y = 1.0 - y;
      p = qin;
      q = pin;
    end

  end

  if ( ( p + q ) * y / ( p + 1.0 ) < eps )

    value = 0.0;

    xb = p * log ( max ( y, sml ) ) - log ( p ) - r4_lbeta ( p, q );

    if ( alnsml < xb && y ~= 0.0 )
      value = exp ( xb );
    end

    if ( y ~= x || p ~= pin )
      value = 1.0 - value;
    end

    return

  end

  ps = q - r4_aint ( q );
  if ( ps == 0.0 )
    ps = 1.0;
  end

  xb = p * log ( y ) - r4_lbeta ( ps, p ) - log ( p );

  if ( xb < alnsml )

    value = 0.0;

  else

    value = exp ( xb );
    term = value * p;

    if ( ps ~= 1.0 )

      n = r4_aint ( max ( alneps / log ( y ), 4.0 ) );
      for i = 1 : n
        term = term * ( i - ps ) * y / i;
        value = value + term / ( p + i );
      end

    end

  end
%
%  Now evaluate the finite sum.
%
  if ( 1.0 < q )

    xb = p * log ( y ) + q * log ( 1.0 - y ) - r4_lbeta ( p, q ) - log ( q );
    ib = r4_aint ( max ( xb / alnsml, 0.0 ) );
    term = exp ( xb - ib * alnsml );
    c = 1.0 / ( 1.0 - y );
    p1 = q * c / ( p + q - 1.0 );

    finsum = 0.0;
    n = r4_aint ( q );
    if ( q == n )
      n = n - 1;
    end

    for i = 1 : n

      if ( p1 <= 1.0 && term / eps <= finsum )
        break
      end

      term = ( q - i + 1.0 ) * c * term / ( p + q - i );

      if ( 1.0 < term )
        ib = ib - 1;
        term = term * sml;
      end

      if ( ib == 0 )
        finsum = finsum + term;
      end

    end

    value = value + finsum;

  end

  if ( y ~= x || p ~= pin )
    value = 1.0 - value;
  end

  if ( value < 0.0 )
    value =  0.0;
  end

  if ( 1.0 < value )
    value = 1.0;
  end

  return
end
