function bisection_rc_test02 ( )

%*****************************************************************************80
%
%% BISECTION_RC_TEST02 tests BISECTION_RC, evaluating the function within the routine.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/bisection_rc/bisection_rc_test02.m
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BISECTION_RC_TEST02\n' );
  fprintf ( 1, '  Demonstrate BISECTION_RC on a simple example.\n' );
  fprintf ( 1, '  The function is evaluated within this routine.\n' );

  fx_tol = 1.0E-09;
  dx_tol = 1.0E-09;
  it = 0;
  it_max = 30;
  job = 0;
  a = 0.0;
  b = 1.0;
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

    fx = cos ( 100.0 * x ) - 4.0 * erf ( 30.0 * x - 10.0 );

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
  fx = cos ( 100.0 * a ) - 4.0 * erf ( 30.0 * a - 10.0 );
  fprintf ( 1, '  A = %g, F(A) = %g\n', a, fx );
  fx = cos ( 100.0 * x ) - 4.0 * erf ( 30.0 * x - 10.0 );
  fprintf ( 1, '  X = %g, F(X) = %g\n', x, fx );
  fx = cos ( 100.0 * b ) - 4.0 * erf ( 30.0 * b - 10.0 );
  fprintf ( 1, '  B = %g, F(B) = %g\n', b, fx );

  return
end
