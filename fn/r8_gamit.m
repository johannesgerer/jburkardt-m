function value = r8_gamit ( a, x )

%*****************************************************************************80
%
%% R8_GAMIT evaluates Tricomi's incomplete gamma function for an R8 argument.
%
%  Discussion:
%
%      GAMIT = x^(-a) / gamma(a)
%        * Integral ( 0 <= t <= x ) exp(-t) * t^(a-1) dt
%
%    with analytic continuation for a <= 0.0.  Gamma(x) is the complete
%    gamma function of X.  GAMIT is evaluated for arbitrary real values of
%    A and for non-negative values of X (even though GAMIT is defined for
%    X < 0.0).
%
%    A slight deterioration of 2 or 3 digits accuracy will occur when
%    gamit is very large or very small in absolute value, because log-
%    arithmic variables are used.  Also, if the parameter A is very close
%    to a negative integer (but not a negative integer), there is a loss
%    of accuracy.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
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
%    Walter Gautschi,
%    A Computational Procedure for Incomplete Gamma Functions,
%    ACM Transactions on Mathematical Software,
%    Volume 5, Number 4, December 1979, pages 466-481.
%
%  Parameters:
%
%    Input, real A, the parameter.
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the function value.
%
  persistent alneps
  persistent bot
  persistent sqeps

  if ( isempty ( alneps ) )
    alneps = - log ( r8_mach ( 3 ) );
    sqeps = sqrt ( r8_mach ( 4 ) );
    bot = log ( r8_mach ( 1 ) );
  end

  if ( x < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GAMIT - Fatal error!\n' );
    fprintf ( 1, '  X is negative.\n' );
    error ( 'R8_GAMIT - Fatal error!' )
  elseif ( x == 0.0 )
    alx = 0.0;
  else
    alx = log ( x );
  end

  if ( a < 0.0 )
    sga = - 1.0;
  else
    sga = + 1.0;
  end

  ainta = r8_aint ( a + 0.5 * sga );
  aeps = a - ainta;

  if ( x == 0.0 )
    if ( 0.0 < ainta || aeps ~= 0.0 )
      value = r8_gamr ( a + 1.0 );
    else
      value = 0.0;
    end
    return
  end

  if ( x <= 1.0 )
    if ( - 0.5 <= a || aeps ~= 0.0 )
      [ algap1, sgngam ] = r8_lgams ( a + 1.0 );
    end
    value = r8_gmit ( a, x, algap1, sgngam, alx );
    return
  end

  if ( x <= a )
    t = r8_lgit (a, x, r8_lngam ( a + 1.0 ) );
    value = exp ( t );
    return
  end

  alng = r8_lgic ( a, x, alx );
%
%  Evaluate in terms of log (r8_gamic (a, x))
%
  h = 1.0;

  if ( aeps ~= 0.0 || 0.0 < ainta )

    [ algap1, sgngam ] = r8_lgams ( a + 1.0 );
    t = log ( abs ( a ) ) + alng - algap1;

    if ( alneps < t )
      t = t - a * alx;
      value = - sga * sgngam * exp ( t );
      return
    end

    if ( - alneps < t )
      h = 1.0 - sga * sgngam * exp ( t );
    end

  end

  t = - a * alx + log ( abs ( h ) );

  if ( h < 0.0 )
    value = - exp ( t );
  else
    value = + exp ( t );
  end

  return
end
