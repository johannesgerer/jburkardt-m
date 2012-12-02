function value = r8_chu ( a, b, x )

%*****************************************************************************80
%
%% R8_CHU evaluates the confluent hypergeometric function of R8 arguments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 October 2011
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
%    Input, real A, B, the parameters.
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the function value.
%
  persistent eps

  if ( isempty ( eps ) )
    eps = r8_mach ( 3 );
  end

  if ( x < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_CHU - Fatal error!\n' );
    fprintf ( 1, '  X < 0.\n' );
    error ( 'R8_CHU - Fatal error!' )
  end

  if ( x == 0.0 )
    if ( 1.0 <= b )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8_CHU - Fatal error!\n' );
      fprintf ( 1, '  X = 0 and 1 <= B.\n' );
      error ( 'R8_CHU - Fatal error!' )
    end
    value = r8_gamma ( 1.0 - b ) / r8_gamma ( 1.0 + a - b );
    return
  end

  if ( max ( abs ( a ), 1.0 ) * max ( abs ( 1.0 + a - b ), 1.0 ) ...
    < 0.99 * abs ( x ) )
    value = x^( - a ) * r8_chu_scaled ( a, b, x );
    return
  end
%
%  The ascending series will be used, because the descending rational
%  approximation (which is based on the asymptotic series) is unstable.
%
  if ( 0.0 <= b )
    aintb = r8_aint ( b + 0.5 );
  else
    aintb = r8_aint ( b - 0.5 );
  end
  beps = b - aintb;
  n = aintb;
  alnx = log ( x );
  xtoeps = exp ( - beps * alnx );
%
%  Evaluate the finite sum.
%
%  Consider the case b < 1.0 first.
%
  if ( n < 1 )

    sum = 1.0;

    t = 1.0;
    m = - n;
    for i = 1 : m
      xi1 = i - 1;
      t = t * ( a + xi1 ) * x / ( ( b + xi1 ) * ( xi1 + 1.0 ) );
      sum = sum + t;
    end

    sum = r8_poch ( 1.0 + a - b, - a ) * sum
%
%  Now consider the case 1 <= b.
%
  else

    sum = 0.0;
    m = n - 2;

    if ( 0 <= m )

      t = 1.0;
      sum = 1.0;

      for i = 1 : m
       xi = i;
        t = t * ( a - b + xi ) * x / ( ( 1.0 - b + xi ) * xi );
        sum = sum + t;
      end

      sum = r8_gamma ( b - 1.0 ) * r8_gamr ( a ) * x^( 1 - n ) * xtoeps * sum;

    end

  end
%
%  Next evaluate the infinite sum.
%
  if ( n < 1 )
    istrt = 1 - n;
  else
    istrt = 0;
  end

  xi = istrt;

  factor = r8_mop ( n ) * r8_gamr ( 1.0 + a - b ) * x^istrt;

  if ( beps ~= 0.0 )
    factor = factor * beps * pi / sin ( beps * pi );
  end

  pochai = r8_poch ( a, xi );
  gamri1 = r8_gamr ( xi + 1.0 );
  gamrni = r8_gamr ( aintb + xi );
  b0 = factor * r8_poch ( a, xi - beps ) * gamrni ...
    * r8_gamr ( xi + 1.0 - beps );
%
%  x^(-beps) is close to 1.0, so we must be careful in evaluating 
%  the differences.
%
  if ( abs ( xtoeps - 1.0 ) <= 0.5 )

    pch1ai = r8_poch1 ( a + xi, - beps );
    pch1i = r8_poch1 ( xi + 1.0 - beps, beps );
    c0 = factor * pochai * gamrni * gamri1 * ( ...
      - r8_poch1 ( b + xi,- beps ) + pch1ai ...
      - pch1i + beps * pch1ai * pch1i );
%
%  xeps1 = (1.0 - x^(-beps))/beps = (x^(-beps) - 1.0)/(-beps)
%
    xeps1 = alnx * r8_exprel ( - beps * alnx );

    value = sum + c0 + xeps1 * b0;
    xn = n;

    for i = 1 : 1000
      xi = istrt + i;
      xi1 = istrt + i - 1;
      b0 = ( a + xi1 - beps ) * b0 * x ...
        / ( ( xn + xi1 ) * ( xi - beps ) );
      c0 = ( a + xi1 ) * c0 * x / ( ( b + xi1) * xi ) ...
        - ( ( a - 1.0 ) * ( xn + 2.0 * xi - 1.0 ) ...
        + xi * ( xi - beps ) ) * b0 ...
        / ( xi * ( b + xi1 ) * ( a + xi1 - beps ) );
      t = c0 + xeps1 * b0;
      value = value + t;
      if ( abs ( t ) < eps * abs ( value ) )
        return
      end
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_CHU - Fatal error!\n' );
    fprintf ( 1, '  No convergence in 1000 terms.\n' );
    error ( 'R8_CHU - Fatal error!' )

  end
%
%  x^(-beps) is very different from 1.0, so the straightforward
%  formulation is stable.
%
  a0 = factor * pochai * r8_gamr ( b + xi ) * gamri1 / beps;
  b0 = xtoeps * b0 / beps;

  value = sum + a0 - b0;

  for i = 1 : 1000
    xi = istrt + i;
    xi1 = istrt + i - 1;
    a0 = ( a + xi1 ) * a0 * x / ( ( b + xi1 ) * xi );
    b0 = ( a + xi1 - beps ) * b0 * x ...
      / ( ( aintb + xi1 ) * ( xi - beps ) );
    t = a0 - b0;
    value = value + t;
    if ( abs ( t ) < eps * abs ( value ) )
      return
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_CHU - Fatal error!\n' );
  fprintf ( 1, '  No convergence in 1000 terms.\n' );
  error ( 'R8_CHU - Fatal error!' )

end
