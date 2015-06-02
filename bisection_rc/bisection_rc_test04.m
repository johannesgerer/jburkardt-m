function bisection_rc_test04 ( )

%*****************************************************************************80
%
%% BISECTION_RC_TEST04 tests BISECTION_RC for the pipe freezing problem.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/bisection_rc/bisection_rc_test04.m
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
%  Reference:
%
%    Cleve Moler,
%    Numerical Computing with MATLAB,
%    SIAM, 2004,
%    ISBN13: 978-0-898716-60-3,
%    LC: QA297.M625,
%    ebook: http://www.mathworks.com/moler/chapters.html
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BISECTION_RC_TEST04\n' );
  fprintf ( 1, '  The freezing pipe problem.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  At the beginning of a cold spell, the soil is at a uniform\n' );
  fprintf ( 1, '  temperature of Ti.  The cold spell applies a uniform air\n' );
  fprintf ( 1, '  temperature of Tc, which begins to cool the soil.\n' );
  fprintf ( 1, '  As a function of depth x and time t, the soil temperature\n' );
  fprintf ( 1, '  will now cool down as:\n' );
  fprintf ( 1, '    ( T(x,t) - Tc ) / ( Ti - Tc ) = erf ( 0.5 * x / sqrt ( alpha * t ) ).\n' );
  fprintf ( 1, '  where:\n' );
  fprintf ( 1, '    Ti =  20 degrees centigrade,\n' );
  fprintf ( 1, '    Tc = -15 degrees centigrade,\n' );
  fprintf ( 1, '    alpha = 0.000000138 meter^2 / second, thermal conductivity;\n' );
  fprintf ( 1, '    and erf() is the error function.\n' );
  fprintf ( 1, '  Water freezes at 0 degrees centigrade.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  What depth x in meters must a water pipe be buried so that it will\n' );
  fprintf ( 1, '  not freeze even if this cold snap lasts for 60 days?\n' );
%
%  Problem parameters.
%
  ti = 20.0;
  tc = -15.0;
  t = 60.0 * 24 * 60.0 * 60.0;
  alpha = 0.000000138;
%
%  Iteration parameters.
%
  fx_tol = 1.0E-09;
  dx_tol = 1.0E-09;
  it = 0;
  it_max = 30;
  job = 0;
  fx = 0.0;
%
%  Initial guess for interval.
%
  a = 0.0;
  b = 1000.0;

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

    fx = tc + ( ti - tc ) * erf ( 0.5 * x / sqrt ( alpha * t ) );

    if ( it <= 2 )
      dx = abs ( b - a );
    else
      dx = 0.5 * abs ( b - a );
    end

    fprintf ( 1, '  %4d  %14.6g  %14.6g  %14.6g\n', it, x, fx, dx );

    if ( abs ( fx ) <= fx_tol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Function is small.\n' );
      break
    end

    if ( dx <= dx_tol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Interval is tiny.\n' );
      break
    end

    if ( it_max <= it )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Reached iteration limit.\n' );
      break
    end

  end

  fprintf ( 1, '\n' );
  fx = tc + ( ti - tc ) * erf ( 0.5 * a / sqrt ( alpha * t ) );;
  fprintf ( 1, '  A = %14.6g, F(A) = %14.6g\n', a, fx );
  fx = tc + ( ti - tc ) * erf ( 0.5 * x / sqrt ( alpha * t ) );
  fprintf ( 1, '  X = %14.6g, F(X) = %14.6g\n', x, fx );
  fx = tc + ( ti - tc ) * erf ( 0.5 * b / sqrt ( alpha * t ) );
  fprintf ( 1, '  B = %14.6g, F(B) = %14.6g\n', b, fx );

  return
end
