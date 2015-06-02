function fem1d_bvp_linear_test02 ( )

%*****************************************************************************80
%
%% FEM1D_BVP_LINEAR_TEST02 carries out test case #2.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/fem1d_bvp_linear/fem1d_bvp_linear_test02.m
%
%  Discussion:
%
%    Use A2, C2, F2, EXACT2, EXACT_UX2.
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
  fprintf ( 1, 'FEM1D_BVP_LINEAR_TEST02\n' );
  fprintf ( 1, '  Solve -( A(x) U''(x) )'' + C(x) U(x) = F(x)\n' );
  fprintf ( 1, '  for 0 < x < 1, with U(0) = U(1) = 0.\n' );
  fprintf ( 1, '  A2(X)  = 1.0\n' );
  fprintf ( 1, '  C2(X)  = 2.0\n' );
  fprintf ( 1, '  F2(X)  = X * ( 5 - X ) * exp ( X )\n' );
  fprintf ( 1, '  U2(X)  = X * ( 1 - X ) * exp ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes = %d\n', n );
%
%  Geometry definitions.
%
  x_first = 0.0;
  x_last = 1.0;
  x = linspace ( x_first, x_last, n );
  x = x(:);

  u = fem1d_bvp_linear ( n, @a2, @c2, @f2, x );

  uexact = exact2 ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I    X         U         Uexact    Error\n' );
  fprintf ( 1, '\n' );

  for i = 1 : n
    fprintf ( 1, '  %4d  %8f  %8f  %8f  %8e\n', ...
      i, x(i), u(i), uexact(i), abs ( u(i) - uexact(i) ) );
  end

  e1 = l1_error ( n, x, u, @exact2 );
  e2 = l2_error_linear ( n, x, u, @exact2 );
  h1s = h1s_error_linear ( n, x, u, @exact_ux2 );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  l1 norm of error  = %g\n', e1 );
  fprintf ( 1, '  L2 norm of error  = %g\n', e2 );
  fprintf ( 1, '  Seminorm of error = %g\n', h1s  );

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
function value = exact2 ( x )

%*****************************************************************************80
%
%% EXACT2 evaluates exact solution #2.
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
function value = exact_ux2 ( x )

%*****************************************************************************80
%
%% EXACT_UX2 evaluates the derivative of exact solution #2.
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

