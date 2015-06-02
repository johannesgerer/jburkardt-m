function fd1d_bvp_test ( )

%*****************************************************************************80
%
%% FD1D_BVP_TEST tests the FD1D_BVP library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2011
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_BVP_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the FD1D_BVP library.\n' );

  fd1d_bvp_test01 ( );
  fd1d_bvp_test02 ( );
  fd1d_bvp_test03 ( );
  fd1d_bvp_test04 ( );
  fd1d_bvp_test05 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_BVP_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function fd1d_bvp_test01 ( )

%*****************************************************************************80
%
%% FD1D_BVP_TEST01 carries out test case #1.
%
%  Discussion:
%
%    Use A1, C1, F1, EXACT1.
%
%    Repeat, using a nonuniform mesh.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 21;
  x1 = 0.0;
  x2 = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_BVP_TEST01\n' );
  fprintf ( 1, '  A1(X)  = 1.0\n' );
  fprintf ( 1, '  A1''(X) = 0.0\n' );
  fprintf ( 1, '  C1(X)  = 0.0\n' );
  fprintf ( 1, '  F1(X)  = X * ( X + 3 ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
  fprintf ( 1, '  X1 = %f\n', x1 );
  fprintf ( 1, '  X2 = %f\n', x2 );
%
%  Set up X, and force it to be a column vector.
%
  x = linspace ( x1, x2, n );

  u = fd1d_bvp ( n, @a1, @a1prime, @c1, @f1, x );

  uexact = exact1 ( x );
  size ( uexact )

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Repeat, using a nonuniform mesh.\n' );
%
%  Set up X, and force it to be a column vector.
%
  x = linspace ( x1, x2, n );

  x = sqrt ( x(1:n) );

  u = fd1d_bvp ( n, @a1, @a1prime, @c1, @f1, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end
%
%  Write the FD data to files.
%
  filename = 'fd1d_bvp_test01_nodes.txt';
  r8mat_write ( filename, 1, n, x );

  u2 = zeros ( 2, n );
  u2(1,1:n) = u(1:n);
  u2(2,1:n) = uexact(1:n);

  filename = 'fd1d_bvp_test01_values.txt';
  r8mat_write ( filename, 2, n, u2 )

  return
end
function fd1d_bvp_test02 ( )

%*****************************************************************************80
%
%% FD1D_BVP_TEST02 carries out test case #2.
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
%    29 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 11;
  x1 = 0.0;
  x2 = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_BVP_TEST02\n' );
  fprintf ( 1, '  A1(X)  = 1.0\n' );
  fprintf ( 1, '  A1''(X) = 0.0\n' );
  fprintf ( 1, '  C2(X)  = 2.0\n' );
  fprintf ( 1, '  F2(X)  = X * ( 5 - X ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
  fprintf ( 1, '  X1 = %f\n', x1 );
  fprintf ( 1, '  X2 = %f\n', x2 );
%
%  Set up X, and force it to be a column vector.
%
  x = linspace ( x1, x2, n );

  u = fd1d_bvp ( n, @a1, @a1prime, @c2, @f2, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end
%
%  Write the FD data to files.
%
  filename = 'fd1d_bvp_test02_nodes.txt';
  r8mat_write ( filename, 1, n, x );

  u2 = zeros ( 2, n );
  u2(1,1:n) = u(1:n);
  u2(2,1:n) = uexact(1:n);

  filename = 'fd1d_bvp_test02_values.txt';
  r8mat_write ( filename, 2, n, u2 )

  return
end
function fd1d_bvp_test03 ( )

%*****************************************************************************80
%
%% FD1D_BVP_TEST03 carries out test case #3.
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
%    29 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 11;
  x1 = 0.0;
  x2 = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_BVP_TEST03\n' );
  fprintf ( 1, '  A1(X)  = 1.0\n' );
  fprintf ( 1, '  A1''(X) = 0.0\n' );
  fprintf ( 1, '  C3(X)  = 2.0 * X\n' );
  fprintf ( 1, '  F3(X)  = - X * ( 2 * X * X - 3 * X - 3 ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
  fprintf ( 1, '  X1 = %f\n', x1 );
  fprintf ( 1, '  X2 = %f\n', x2 );
%
%  Set up X, and force it to be a column vector.
%
  x = linspace ( x1, x2, n );

  u = fd1d_bvp ( n, @a1, @a1prime, @c3, @f3, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end
%
%  Write the FD data to files.
%
  filename = 'fd1d_bvp_test03_nodes.txt';
  r8mat_write ( filename, 1, n, x );

  u2 = zeros ( 2, n );
  u2(1,1:n) = u(1:n);
  u2(2,1:n) = uexact(1:n);

  filename = 'fd1d_bvp_test03_values.txt';
  r8mat_write ( filename, 2, n, u2 )

  return
end
function fd1d_bvp_test04 ( )

%*****************************************************************************80
%
%% FD1D_BVP_TEST04 carries out test case #4.
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
%    29 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 11;
  x1 = 0.0;
  x2 = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_BVP_TEST04\n' );
  fprintf ( 1, '  A2(X)  = 1.0 + X * X\n' );
  fprintf ( 1, '  A2''(X) = 2.0 * X\n' );
  fprintf ( 1, '  C1(X)  = 0.0\n' );
  fprintf ( 1, '  F4(X)  = ( X + 3 X^2 + 5 X^3 + X^4 ) * exp ( X )\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
  fprintf ( 1, '  X1 = %f\n', x1 );
  fprintf ( 1, '  X2 = %f\n', x2 );
%
%  Set up X, and force it to be a column vector.
%
  x = linspace ( x1, x2, n );

  u = fd1d_bvp ( n, @a2, @a2prime, @c1, @f4, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end
%
%  Write the FD data to files.
%
  filename = 'fd1d_bvp_test04_nodes.txt';
  r8mat_write ( filename, 1, n, x );

  u2 = zeros ( 2, n );
  u2(1,1:n) = u(1:n);
  u2(2,1:n) = uexact(1:n);

  filename = 'fd1d_bvp_test04_values.txt';
  r8mat_write ( filename, 2, n, u2 )

  return
end
function fd1d_bvp_test05 ( )

%*****************************************************************************80
%
%% FD1D_BVP_TEST05 carries out test case #5.
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
%    29 January 2011
%
%  Author:
%
%    John Burkardt
%
  n = 11;
  x1 = 0.0;
  x2 = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_BVP_TEST05\n' );
  fprintf ( 1, '  A3(X)  = 1.0 + X * X for X <= 1/3\n' );
  fprintf ( 1, '         = 7/9 + X     for      1/3 < X\n' );
  fprintf ( 1, '  A3''(X) = 2.0 * X     for X <= 1/3\n' );
  fprintf ( 1, '           1           for      1/3 < X\n' );
  fprintf ( 1, '  C1(X)  = 0.0\n' );
  fprintf ( 1, '  F5(X)  = ( X + 3 X^2 + 5 X^3 + X^4 ) * exp ( X )\n' );
  fprintf ( 1, '                       for X <= 1/3\n' );
  fprintf ( 1, '         = ( - 1 + 10/3 X + 43/9 X^2 + X^3 ) .* exp ( X )\n' );
  fprintf ( 1, '                       for      1/3 <= X\n' );
  fprintf ( 1, '  U1(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
  fprintf ( 1, '  X1 = %f\n', x1 );
  fprintf ( 1, '  X2 = %f\n', x2 );

  x = linspace ( x1, x2, n );

  u = fd1d_bvp ( n, @a3, @a3prime, @c1, @f5, x );

  uexact = exact1 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end
%
%  Write the FD data to files.
%
  filename = 'fd1d_bvp_test05_nodes.txt';
  r8mat_write ( filename, 1, n, x );

  u2 = zeros ( 2, n );
  u2(1,1:n) = u(1:n);
  u2(2,1:n) = uexact(1:n);

  filename = 'fd1d_bvp_test05_values.txt';
  r8mat_write ( filename, 2, n, u2 )

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
function value = a1prime ( x )

%*****************************************************************************80
%
%% A1PRIME evaluates A' function #1.
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
%    Output, real VALUE, the value of A(X).
%
  value = 0.0;

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
function value = a2prime ( x )

%*****************************************************************************80
%
%% A2PRIME evaluates A' function #2.
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
%    Output, real VALUE, the value of A(X).
%
  value = 2.0 * x;

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
function value = a3prime ( x )

%*****************************************************************************80
%
%% A3PRIME evaluates A' function #3.
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
%    Output, real VALUE, the value of A(X).
%
  value = ...
      ( 2.0 * x )  .*  ( x <= 1.0 / 3.0 ) ...
    + ( 1.0 )      .*  (      1.0 / 3.0 < x );

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

