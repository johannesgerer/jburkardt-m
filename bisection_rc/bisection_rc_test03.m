function bisection_rc_test03 ( )

%*****************************************************************************80
%
%% BISECTION_RC_TEST03 tests BISECTION_RC, to invert the cardiod CDF.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/bisection_rc/bisection_rc_test03.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2013
%
%  Author:
%
%    John Burkardt
%
  alpha = 0.0;
  beta = 0.25;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BISECTION_RC_TEST03\n' );
  fprintf ( 1, '  Demonstrate BISECTION_RC on a probability example.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The cardioid probability density function has a\n' );
  fprintf ( 1, '  cumulative density function of the form:\n' );
  fprintf ( 1, '    CDF(X) = ( pi + x - alpha + 2 beta * sin ( x - alpha ) ) / ( 2 * pi )\n' );
  fprintf ( 1, '  where alpha and beta are parameters, and x is a value\n' );
  fprintf ( 1, '  in the range -pi <= x <= +pi.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  CDF(X) is the probability that a random sample will have\n' );
  fprintf ( 1, '  a value less than or equal to X.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  As X moves from -pi to +pi,\n' );
  fprintf ( 1, '  the CDF rises from 0 (no probability)\n' );
  fprintf ( 1, '  to 1 (certain probability).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Assuming that:\n' );
  fprintf ( 1, '  * ALPHA = %g\n', alpha );
  fprintf ( 1, '  * BETA =  %g\n', beta );
  fprintf ( 1, '  determine the value X where the Cardioid CDF is exactly 0.75.\n' );

  fx_tol = 1.0E-06;
  dx_tol = 1.0E-08;
  it = 0;
  it_max = 30;
  job = 0;
  a = - pi;
  b = + pi;
  fx = 0.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      X               FX              DX\n' );
  fprintf ( 1, '\n' );

  while ( 1 )

    [ a, b, x, job ] = bisection_rc ( a, b, fx, job );

    if ( job < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Error return.\n' );
      break;
    end

    it = it + 1;

    cdf = ( pi + x - alpha + 2.0 * beta * sin ( x - alpha ) ) / ( 2.0 * pi );
    fx = cdf - 0.75;

    if ( it <= 2 )
      dx = abs ( b - a );
    else
      dx = 0.5 * abs ( b - a );
    end

    fprintf ( 1, '  %4d  %14.6g  %14.6g  %14.6g\n', it, x, fx, dx );

    if ( abs ( fx ) <= fx_tol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Function is small.\n' );
      break;
    end

    if ( dx <= dx_tol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Interval is tiny.\n' );
      break;
    end

    if ( it_max <= it )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Reached iteration limit.\n' );
      break;
    end

  end

  fprintf ( 1, '\n' );
  cdf = ( pi + a - alpha + 2.0 * beta * sin ( a - alpha ) ) / ( 2.0 * pi );
  fx = cdf - 0.75;
  fprintf ( 1, '  A = %14.6g, F(A) = %14.6g\n', a, fx );
  cdf = ( pi + x - alpha + 2.0 * beta * sin ( x - alpha ) ) / ( 2.0 * pi );
  fx = cdf - 0.75;
  fprintf ( 1, '  X = %14.6g, F(X) = %14.6g\n', x, fx );
  cdf = ( pi + b - alpha + 2.0 * beta * sin ( b - alpha ) ) / ( 2.0 * pi );
  fx = cdf - 0.75;
  fprintf ( 1, '  B = %14.6g, F(B) = %14.6g\n', b, fx );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Look at the actual cardioid CDF value now:\n' );
  fprintf ( 1, '\n' );
  cdf = ( pi + x - alpha + 2.0 * beta * sin ( x - alpha ) ) / ( 2.0 * pi );
  fprintf ( 1, '  Cardioid(%g) = %g\n', x, cdf );
  return
end
