function fem1d_bvp_quadratic_test06 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_QUADRATIC_TEST06 does an error analysis.
%
%  Discussion:
%
%    Use A6, C6, F6, EXACT6, EXACT_UX6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_QUADRATIC_TEST06\n' );
  fprintf ( 1, '  Solve -( A(x) U''(x) )'' + C(x) U(x) = F(x)\n' );
  fprintf ( 1, '  for 0 < x < 1, with U(0) = U(1) = 0.\n' );
  fprintf ( 1, '  A6(X)  = 1.0\n' );
  fprintf ( 1, '  C6(X)  = 0.0\n' );
  fprintf ( 1, '  F6(X)  = pi*pi*sin(pi*X)\n' );
  fprintf ( 1, '  U6(X)  = sin(pi*x)\n' );
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

    u = fem1d_bvp_quadratic ( n, @a6, @c6, @f6, x );

    e1 = l1_error ( n, x, u, @exact6 );
    e2 = l2_error_quadratic ( n, x, u, @exact6 );
    h1s = h1s_error_quadratic ( n, x, u, @exact_ux6 );

    fprintf ( 1, '  %4d  %14f  %14f  %14f\n', n, e1, e2, h1s );

    n = 2 * ( n - 1 ) + 1;

  end

  return
end
function value = a6 ( x )

%*****************************************************************************80
%
%% A6 evaluates A function #6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2014
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
  value = 1.0;

  return
end
function value = c6 ( x )

%*****************************************************************************80
%
%% C6 evaluates C function #6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2014
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
function value = exact6 ( x )

%*****************************************************************************80
%
%% EXACT6 returns exact solution #6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2014
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
  value = sin ( pi * x );

  return
end
function value = exact_ux6 ( x )

%*****************************************************************************80
%
%% EXACT_UX6 evaluates the derivative of exact solution #6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2014
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
  value = pi * cos ( pi * x );

  return
end
function value = f6 ( x )

%*****************************************************************************80
%
%% F6 evaluates right hand side function #6.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2012
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
  value = pi * pi * sin ( pi * x );

  return
end

