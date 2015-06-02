function fem1d_bvp_quadratic_test05 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_QUADRATIC_TEST05 carries out test case #5.
%
%  Discussion:
%
%    Use A5, C5, F5, EXACT5, EXACT_UX5.
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
%  Reference:
%
%    Dianne O'Leary,
%    Scientific Computing with Case Studies,
%    SIAM, 2008,
%    ISBN13: 978-0-898716-66-5,
%    LC: QA401.O44.
%
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_QUADRATIC_TEST05\n' );
  fprintf ( 1, '  Solve -( A(x) U''(x) )'' + C(x) U(x) = F(x)\n' );
  fprintf ( 1, '  for 0 < x < 1, with U(0) = U(1) = 0.\n' );
  fprintf ( 1, '  A5(X)  = 1.0 + X * X for X <= 1/3\n' );
  fprintf ( 1, '         = 7/9 + X     for      1/3 < X\n' );
  fprintf ( 1, '  C5(X)  = 0.0\n' );
  fprintf ( 1, '  F5(X)  = ( X + 3 X^2 + 5 X^3 + X^4 ) * exp ( X )\n' );
  fprintf ( 1, '                       for X <= 1/3\n' );
  fprintf ( 1, '         = ( - 1 + 10/3 X + 43/9 X^2 + X^3 ) .* exp ( X )\n' );
  fprintf ( 1, '                       for      1/3 <= X\n' );
  fprintf ( 1, '  U5(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  x_first = 0.0;
  x_last = 1.0;
  x = linspace ( x_first, x_last, n );
  x = x(:);

  u = fem1d_bvp_quadratic ( n, @a5, @c5, @f5, x );

  uexact = exact5 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  e1 = l1_error ( n, x, u, @exact5 );
  e2 = l2_error_quadratic ( n, x, u, @exact5 );
  h1s = h1s_error_quadratic ( n, x, u, @exact_ux5 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  l1 norm of error  = %g\n', e1 );
  fprintf ( 1, '  L2 norm of error  = %g\n', e2 );
  fprintf ( 1, '  Seminorm of error = %g\n', h1s );

  return
end
function value = a5 ( x )

%*****************************************************************************80
%
%% A5 evaluates A function #5.
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
  value = ...
      ( 1.0 + x .* x )   .*  ( x <= 1.0 / 3.0 ) ...
    + ( x + 7.0 / 9.0 )  .*  (      1.0 / 3.0 < x );

  return
end
function value = c5 ( x )

%*****************************************************************************80
%
%% C5 evaluates C function #5.
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
function value = exact5 ( x )

%*****************************************************************************80
%
%% EXACT5 evaluates exact solution #5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 March 2009
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
  value = x .* ( 1.0 - x ) .* exp ( x );

  return
end
function value = exact_ux5 ( x )

%*****************************************************************************80
%
%% EXACT_UX5 evaluates the derivative of exact solution #5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2012
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
  value = ( 1.0 - x - x .* x ) .* exp ( x );

  return
end
function value = f5 ( x )

%*****************************************************************************80
%
%% F5 evaluates right hand side function #5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2009
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
  value = ...
    ( ( x + 3.0 * x.^2 + 5.0 * x.^3 + x.^4 ) .* exp ( x ) ) ...
    .* ( x <= 1.0 / 3.0 ) ...
    + ( - 1.0 + ( 10.0 / 3.0 ) * x ...
    + ( 43.0 / 9.0 ) * x.^2 + x.^3 ) .* exp ( x ) ...
    .* ( 1.0 / 3.0 < x );

  return
end

