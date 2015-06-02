function fem1d_bvp_linear_test04 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST04 carries out test case #4.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/fem1d_bvp_linear/fem1d_bvp_linear_test04.m
%
%  Discussion:
%
%    Use A4, C4, F4, EXACT4, EXACT_UX4.
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
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST04\n' );
  fprintf ( 1, '  Solve -( A(x) U''(x) )'' + C(x) U(x) = F(x)\n' );
  fprintf ( 1, '  for 0 < x < 1, with U(0) = U(1) = 0.\n' );
  fprintf ( 1, '  A4(X)  = 1.0 + X * X\n' );
  fprintf ( 1, '  C4(X)  = 0.0\n' );
  fprintf ( 1, '  F4(X)  = ( X + 3 X^2 + 5 X^3 + X^4 ) * exp ( X )\n' );
  fprintf ( 1, '  U4(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  x_first = 0.0;
  x_last = 1.0;
  x = linspace ( x_first, x_last, n );
  x = x(:);

  u = fem1d_bvp_linear ( n, @a4, @c4, @f4, x );

  uexact = exact4 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  e1 = l1_error ( n, x, u, @exact4 );
  e2 = l2_error_linear ( n, x, u, @exact4 );
  h1s = h1s_error_linear ( n, x, u, @exact_ux4 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  l1 norm of error  = %g\n', e1 );
  fprintf ( 1, '  L2 norm of error  = %g\n', e2 );
  fprintf ( 1, '  Seminorm of error = %g\n', h1s  );

  return
end
function value = a4 ( x )

%*****************************************************************************80
%
%% A4 evaluates A function #4.
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
  value = 1.0 + x .* x;

  return
end
function value = c4 ( x )

%*****************************************************************************80
%
%% C4 evaluates C function #4.
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
function value = exact4 ( x )

%*****************************************************************************80
%
%% EXACT4 evaluates exact solution #4.
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

