function value = r8_gmic ( a, x, alx )

%*****************************************************************************80
%
%% R8_GMIC: complementary incomplete gamma, small X, A near negative integer.
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
%    Input, real A, the parameter.
%
%    Input, real X, the argument.
%
%    Input, real ALX, the logarithm of X.
%
%    Output, real VALUE, the complementary incomplete
%    gamma function.
%
  persistent bot
  persistent eps

  euler = 0.57721566490153286060651209008240;

  if ( isempty ( eps ) )
    eps = 0.5 * r8_mach ( 3 );
    bot = log ( r8_mach ( 1 ) );
  end

  if ( 0.0 < a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GMIC - Fatal error!\n' );
    fprintf ( 1, '  A must be near a negative integer.\n' );
    error ( 'R8_GMIC - Fatal error!' )
  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GMIC - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R8_GMIC - Fatal error!' )
  end

  m = - r8_aint ( a - 0.5 );
  fm = m;

  te = 1.0;
  t = 1.0;
  s = t;
  converged = 0;
  for k = 1 : 200
    fkp1 = k + 1;
    te = - x * te / ( fm + fkp1 );
    t = te / fkp1;
    s = s + t;
    if ( abs ( t ) < eps * s )
      converged = 1;
      break
    end
  end

  if ( ~ converged )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_GMIC - Fatal error!\n' );
    fprintf ( 1, '  No convergence after 200 iterations.\n' );
    error ( 'R8_GMIC - Fatal error!' )
  end

  value = - alx - euler + x * s / ( fm + 1.0 );

  if ( m == 0 )
    return;
  elseif ( m == 1 )
    value = - value - 1.0 + 1.0 / x;
    return
  end

  te = fm;
  t = 1.0;
  s = t;
  mm1 = m - 1;
  for k = 1 : mm1
    fk = k;
    te = - x * te / fk;
    t = te / ( fm - fk );
    s = s + t;
    if ( abs ( t ) < eps * abs ( s ) )
      break
    end
  end

  for k = 1 : m
    value = value + 1.0 / k;
  end

  if ( mod ( m, 2 ) == 1 )
    sgng = - 1.0;
  else
    sgng = + 1.0;
  end

  alng = log ( value ) - r8_lngam ( fm + 1.0 );

  if ( bot < alng )
    value = sgng * exp ( alng );
  else
    value = 0.0;
  end

  if ( s ~= 0.0 )
    value = value ...
      + abs ( exp ( - fm * alx + log ( abs ( s ) / fm ) ) ) * r8_sign ( s );
  end

  return
end
