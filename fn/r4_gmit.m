function value = r4_gmit ( a, x, algap1, sgngam, alx )

%*****************************************************************************80
%
%% R4_GMIT: Tricomi's incomplete gamma function for small X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
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
%    Input, real ALGAP1, the logarithm of Gamma ( A + 1 ).
%
%    Input, real SGNGAM, the sign of Gamma ( A + 1 ).
%
%    Input, real ALX, the logarithm of X.
%
%    Output, real VALUE, the Tricomi incomplete gamma function.
%
  persistent bot
  persistent eps

  if ( isempty ( eps ) )
    eps = 0.5 * r4_mach ( 3 );
    bot = log ( r4_mach ( 1 ) );
  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_GMIT - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R4_GMIT - Fatal error!' )
  end

  if ( a < 0.0 )
    ma = r4_aint ( a - 0.5 );
  else
    ma = r4_aint ( a + 0.5 );
  end

  aeps = a - ma;

  if ( a < - 0.5 )
    ae = aeps;
  else
    ae = a;
  end

  t = 1.0;
  te = ae;
  s = t;
  converged = 0;

  for k = 1 : 200
    fk = k;
    te = - x * te / fk;
    t = te / ( ae + fk );
    s = s + t;
    if ( abs ( t ) < eps * abs ( s ) )
      converged = 1;
      break
    end
  end

  if ( ~ converged )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_GMIT - Fatal error!\n' );
    fprintf ( 1, '  No convergence in 200 iterations.\n' );
    error ( 'R4_GMIT - Fatal error!' )
  end

  if ( - 0.5 <= a )
    algs = - algap1 + log ( s );
    value = exp ( algs );
    return
  end

  algs = - r4_lngam ( 1.0 + aeps ) + log ( s );
  s = 1.0;
  m = - ma - 1;
  t = 1.0;

  for k = 1 : m
    t = x * t / ( aeps - ( m + 1 - k ) );
    s = s + t;
    if ( abs ( t ) < eps * abs ( s ) )
      break
    end
  end

  value = 0.0;
  algs = - ma * log ( x ) + algs;

  if ( s == 0.0 || aeps == 0.0 )
    value = exp ( algs );
    return
  end

  sgng2 = sgngam * r8_sign ( s );
  alg2 = - x - algap1 + log ( abs ( s ) );

  if ( bot < alg2 )
    value = sgng2 * exp ( alg2 );
  end

  if ( bot < algs )
    value = value + exp ( algs );
  end

  return
end
