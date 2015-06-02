function fem1d_bvp_quadratic_test07 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_QUADRATIC_TEST07 does an error analysis.
%
%  Discussion:
%
%    Use A7, C7, F7, EXACT7, EXACT_UX7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Eric Becker, Graham Carey, John Oden,
%    Finite Elements, An Introduction, Volume I,
%    Prentice-Hall, 1981, page 123-124,
%    ISBN: 0133170578,
%    LC: TA347.F5.B4.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_QUADRATIC_TEST07\n' );
  fprintf ( 1, '  Becker/Carey/Oden example.\n' );
  fprintf ( 1, '  Solve -( A(x) U''(x) )'' + C(x) U(x) = F(x)\n' );
  fprintf ( 1, '  for 0 < x < 1, with U(0) = U(1) = 0.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute L2 norm and seminorm of error for various N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N        L1 error        L2 error      Seminorm error\n' );
  fprintf ( 1, '\n' );

  n = 11;
  for i = 0 : 4
%
%  Geometry definitions.
%
    x_first = 0.0;
    x_last = 1.0;
    x = linspace ( x_first, x_last, n );
    x = x(:);

    u = fem1d_bvp_quadratic ( n, @a7, @c7, @f7, x );

    e1 = l1_error ( n, x, u, @exact7 );
    e2 = l2_error_quadratic ( n, x, u, @exact7 );
    h1s = h1s_error_quadratic ( n, x, u, @exact_ux7 );

    fprintf ( 1, '  %4d  %14f  %14f  %14f\n', n, e1, e2, h1s );

    n = 2 * ( n - 1 ) + 1;

  end

  return
end
function value = a7 ( x )

%*****************************************************************************80
%
%% A7 evaluates A function #7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of A(X).
%
  alpha = 30.0;
  x0 = 1.0 / 3.0;
  value = 1.0 / alpha + alpha * ( x - x0 ) .^ 2;

  return
end
function value = c7 ( x )

%*****************************************************************************80
%
%% C7 evaluates C function #7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of C(X).
%
  value = 0.0;

  return
end
function value = exact7 ( x )

%*****************************************************************************80
%
%% EXACT7 returns exact solution #7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of U(X).
%
  alpha = 30.0;
  x0 = 1.0 / 3.0;
  value = ( 1.0 - x ) .* ( atan ( alpha * ( x - x0 ) ) + atan ( alpha * x0 ) );

  return
end
function value = exact_ux7 ( x )

%*****************************************************************************80
%
%% EXACT_UX7 evaluates the derivative of exact solution #7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of dUdX(X).
%
  alpha = 30.0;
  x0 = 1.0 / 3.0;
  value = - atan ( alpha * ( x - x0 ) ) - atan ( alpha * x0 ) ...
    + ( 1.0 - x ) * alpha ./ ( 1.0 + alpha * alpha * ( x - x0 ) .^ 2 );

  return
end
function value = f7 ( x )

%*****************************************************************************80
%
%% F7 evaluates right hand side function #7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real VALUE, the value of F(X).
%
  alpha = 30.0;
  x0 = 1.0 / 3.0;
  value = 2.0 * ( 1.0 + alpha * ( x - x0 ) .* ...
    ( atan ( alpha * ( x - x0 ) ) + atan ( alpha * x0 ) ) ); 

  return
end

