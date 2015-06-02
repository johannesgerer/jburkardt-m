function bisection_rc_test01 ( )

%*****************************************************************************80
%
%% BISECTION_RC_TEST01 tests BISECTION_RC, evaluating the function in a separate routine.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/bisection_rc/bisection_rc_test01.m
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
  fprintf ( 1, 'BISECTION_RC_TEST01\n' );
  fprintf ( 1, '  Demonstrate BISECTION_RC on a simple example.\n' );
  fprintf ( 1, '  The function is evaluated in a separate routine.\n' );

  fx_tol = 1.0E-08;
  dx_tol = 1.0E-06;
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

    fx = f01 ( x );

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
  fprintf ( 1, '  A = %14g, F(A) = %14g\n', a, f01 ( a ) );
  fprintf ( 1, '  X = %14g, F(X) = %14g\n', x, f01 ( x ) );
  fprintf ( 1, '  B = %14g, F(B) = %14g\n', b, f01 ( b ) );

  return
end
function value = f01 ( x )

%*****************************************************************************80
%
%% F01 evaluates the function f(x) = cos ( x ) - x which is zero around 0.74
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
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the function value.
%
  value = cos ( x ) - x;

  return
end
