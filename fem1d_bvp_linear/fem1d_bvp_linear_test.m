function fem1d_bvp_linear_test ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST tests the routines in FEM1D_BVP_LINEAR.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FEM1D_BVP_LINEAR library.\n' );

  fem1d_bvp_linear_test01 ( );
  fem1d_bvp_linear_test02 ( );
  fem1d_bvp_linear_test03 ( );
  fem1d_bvp_linear_test04 ( );
  fem1d_bvp_linear_test05 ( );
  fem1d_bvp_linear_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function fem1d_bvp_linear_test01 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST01 carries out test case #1.
%
%  Discussion:
%
%    Use A1, C1, F1, EXACT1.
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
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST01\n' );
  fprintf ( 1, '  A1(X)  = 1.0\n' );
  fprintf ( 1, '  C1(X)  = 0.0\n' );
  fprintf ( 1, '  F1(X)  = X * ( X + 3 ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  x_first = 0.0;
  x_last = 1.0;
  x = linspace ( x_first, x_last, n );

  u = fem1d_bvp_linear ( n, @a1, @c1, @f1, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  l2_error = compute_l2_error ( n, x, u, @exact1 );
  seminorm_error = compute_seminorm_error ( n, x, u, @exact_ux1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 norm of error  = %g\n', l2_error );
  fprintf ( 1, '  Seminorm of error = %g\n', seminorm_error );

  return
end
function fem1d_bvp_linear_test02 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST02 carries out test case #2.
%
%  Discussion:
%
%    Use A1, C2, F2, EXACT1.
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
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST02\n' );
  fprintf ( 1, '  A1(X)  = 1.0\n' );
  fprintf ( 1, '  C2(X)  = 2.0\n' );
  fprintf ( 1, '  F2(X)  = X * ( 5 - X ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  x_first = 0.0;
  x_last = 1.0;
  x = linspace ( x_first, x_last, n );

  u = fem1d_bvp_linear ( n, @a1, @c2, @f2, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  l2_error = compute_l2_error ( n, x, u, @exact1 );
  seminorm_error = compute_seminorm_error ( n, x, u, @exact_ux1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 norm of error  = %g\n', l2_error );
  fprintf ( 1, '  Seminorm of error = %g\n', seminorm_error );

  return
end
function fem1d_bvp_linear_test03 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST03 carries out test case #3.
%
%  Discussion:
%
%    Use A1, C3, F3, EXACT1.
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
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST03\n' );
  fprintf ( 1, '  A1(X)  = 1.0\n' );
  fprintf ( 1, '  C3(X)  = 2.0 * X\n' );
  fprintf ( 1, '  F3(X)  = - X * ( 2 * X * X - 3 * X - 3 ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  x_first = 0.0;
  x_last = 1.0;
  x = linspace ( x_first, x_last, n );

  u = fem1d_bvp_linear ( n, @a1, @c3, @f3, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  l2_error = compute_l2_error ( n, x, u, @exact1 );
  seminorm_error = compute_seminorm_error ( n, x, u, @exact_ux1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 norm of error  = %g\n', l2_error );
  fprintf ( 1, '  Seminorm of error = %g\n', seminorm_error );

  return
end
function fem1d_bvp_linear_test04 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST04 carries out test case #4.
%
%  Discussion:
%
%    Use A2, C1, F4, EXACT1.
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
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST04\n' );
  fprintf ( 1, '  A2(X)  = 1.0 + X * X\n' );
  fprintf ( 1, '  C1(X)  = 0.0\n' );
  fprintf ( 1, '  F4(X)  = ( X + 3 X^2 + 5 X^3 + X^4 ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  x_first = 0.0;
  x_last = 1.0;
  x = linspace ( x_first, x_last, n );

  u = fem1d_bvp_linear ( n, @a2, @c1, @f4, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  l2_error = compute_l2_error ( n, x, u, @exact1 );
  seminorm_error = compute_seminorm_error ( n, x, u, @exact_ux1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 norm of error  = %g\n', l2_error );
  fprintf ( 1, '  Seminorm of error = %g\n', seminorm_error );

  return
end
function fem1d_bvp_linear_test05 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST05 carries out test case #5.
%
%  Discussion:
%
%    Use A3, C1, F5, EXACT1.
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
  n = 11;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST05\n' );
  fprintf ( 1, '  A3(X)  = 1.0 + X * X for X <= 1/3\n' );
  fprintf ( 1, '         = 7/9 + X     for      1/3 < X\n' );
  fprintf ( 1, '  C1(X)  = 0.0\n' );
  fprintf ( 1, '  F5(X)  = ( X + 3 X^2 + 5 X^3 + X^4 ) * exp ( X )\n' );
  fprintf ( 1, '                       for X <= 1/3\n' );
  fprintf ( 1, '         = ( - 1 + 10/3 X + 43/9 X^2 + X^3 ) .* exp ( X )\n' );
  fprintf ( 1, '                       for      1/3 <= X\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  x_first = 0.0;
  x_last = 1.0;
  x = linspace ( x_first, x_last, n );

  u = fem1d_bvp_linear ( n, @a3, @c1, @f5, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  l2_error = compute_l2_error ( n, x, u, @exact1 );
  seminorm_error = compute_seminorm_error ( n, x, u, @exact_ux1 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 norm of error  = %g\n', l2_error );
  fprintf ( 1, '  Seminorm of error = %g\n', seminorm_error );

  return
end
function fem1d_bvp_linear_test06 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST06 does an error analysis.
%
%  Discussion:
%
%    Use A1, C1, F6, EXACT4.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST06\n' );
  fprintf ( 1, '  A1(X)  = 1.0\n' );
  fprintf ( 1, '  C1(X)  = 0.0\n' );
  fprintf ( 1, '  F6(X)  = pi*pi*sin(pi*X)\n' );
  fprintf ( 1, '  U4(X)  = sin(pi*x)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Compute L2 norm and seminorm of error for various N.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     N        L2 error      Seminorm error\n' );
  fprintf ( 1, '\n' );

  n = 11;
  for i = 0 : 4
%
%  Geometry definitions.
%
    x_first = 0.0;
    x_last = 1.0;
    x = linspace ( x_first, x_last, n );

    u = fem1d_bvp_linear ( n, @a1, @c1, @f6, x );

    l2_error = compute_l2_error ( n, x, u, @exact4 );
    seminorm_error = compute_seminorm_error ( n, x, u, @exact_ux4 );

    fprintf ( 1, '  %4d  %14f  %14f\n', n, l2_error, seminorm_error );

    n = 2 * ( n - 1 ) + 1;

  end

  return
end
function value = a1 ( x )

%*****************************************************************************80
%
%% A1 evaluates A function #1.
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
%    Output, real VALUE, the value of A(X).
%
  value = 1.0;

  return
end
function value = a2 ( x )

%*****************************************************************************80
%
%% A2 evaluates A function #2.
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
%    Output, real VALUE, the value of A(X).
%
  value = 1.0 + x .* x;

  return
end
function value = a3 ( x )

%*****************************************************************************80
%
%% A3 evaluates A function #3.
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
%    Output, real VALUE, the value of A(X).
%
  value = ...
      ( 1.0 + x .* x )   .*  ( x <= 1.0 / 3.0 ) ...
    + ( x + 7.0 / 9.0 )  .*  (      1.0 / 3.0 < x );

  return
end
function value = c1 ( x )

%*****************************************************************************80
%
%% C1 evaluates C function #1.
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
%    Output, real VALUE, the value of C(X).
%
  value = 0.0;

  return
end
function value = c2 ( x )

%*****************************************************************************80
%
%% C2 evaluates C function #2.
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
%    Output, real VALUE, the value of C(X).
%
  value = 2.0;

  return
end
function value = c3 ( x )

%*****************************************************************************80
%
%% C3 evaluates C function #3.
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
%    Output, real VALUE, the value of C(X).
%
  value = 2.0 * x;

  return
end
function value = f1 ( x )

%*****************************************************************************80
%
%% F1 evaluates right hand side function #1.
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
  value = x .* ( x + 3.0 ) .* exp ( x );

  return
end
function value = f2 ( x )

%*****************************************************************************80
%
%% F2 evaluates right hand side function #2.
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
%    Output, real VALUE, the value of F(X).
%
  value = x .* ( 5.0 - x ) .* exp ( x );

  return
end
function value = f3 ( x )

%*****************************************************************************80
%
%% F3 evaluates right hand side function #3.
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
  value = - x .* ( 2.0 * x .* x - 3.0 * x - 3.0 ) .* exp ( x );

  return
end
function value = f4 ( x )

%*****************************************************************************80
%
%% F4 evaluates right hand side function #4.
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
  value = ( x + 3.0 * x.^2 + 5.0 * x.^3 + x.^4 ) .* exp ( x );

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
      ( ( x + 3.0 * x.^2 + 5.0 * x.^3 + x.^4 ) .* exp ( x ) ) .* ( x <= 1.0 / 3.0 ) ...
    + ( - 1.0 + ( 10.0 / 3.0 ) * x + ( 43.0 / 9.0 ) * x.^2 + x.^3 ) .* exp ( x ) ...
      .* ( 1.0 / 3.0 < x );

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
function value = exact1 ( x )

%*****************************************************************************80
%
%% EXACT1 evaluates exact solution #1.
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
  value = x .* ( 1 - x ) .* exp ( x );

  return
end
function value = exact_ux1 ( x )

%*****************************************************************************80
%
%% EXACT_UX1 evaluates the derivative of exact solution #1.
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
function value = exact2 ( x )

%*****************************************************************************80
%
%% EXACT2 returns exact solution #2.
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
  value = ...
      ( x .* ( 1.0 - x ) .* exp ( x ) )          .* ( x <= 2.0 / 3.0 ) ...
    + ( x .* ( 1.0 - x )  * exp ( 2.0 / 3.0 ) )  .* (      2.0 / 3.0 < x );

  return
end
function value = exact3 ( x )

%*****************************************************************************80
%
%% EXACT3 returns exact solution #3.
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
  value = ...
      ( x .* ( 1.0 - x ) .* exp ( x ) )  .* ( x <= 2.0 / 3.0 ) ...
    + ( x .* ( 1.0 - x ) )               .*      ( 2.0 / 3.0 < x );

  return
end
function value = exact4 ( x )

%*****************************************************************************80
%
%% EXACT4 returns exact solution #4.
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
%    Output, real VALUE, the value of U(X).
%
  value = sin ( pi * x );

  return
end
function value = exact_ux4 ( x )

%*****************************************************************************80
%
%% EXACT_UX4 evaluates the derivative of exact solution #4.
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
%    Output, real VALUE, the value of dUdX(X).
%
  value = pi * cos ( pi * x );

  return
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
