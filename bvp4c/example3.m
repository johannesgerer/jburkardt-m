function example3 ( )

%*****************************************************************************80
%
%% EXAMPLE3 uses BVP4C to solve the EXAMPLE3 problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2013
%
%  Author:
%
%    Original MATLAB version by Shampine, Kierzenka, Reichelt.
%    This version by John Burkardt.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE3:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use BVP4C to solve the following eigenvalue boundary value problem:\n' );
  fprintf ( 1, '  y" + (lambda - 2 q cos(2x) y = 0\n' );
  fprintf ( 1, '  y''(0) = 0, y''(pi) = 0, y(0) 1\n' );
  fprintf ( 1, '  The initial guess is set using the functional form for y_init.\n' );
%
%  We need an estimate for the unknown parameter lambda.
%
  lambda = 15.0;
%
%  Set SOLINIT, the structure defining the initial guess.
%
  x_init = linspace ( 0.0, pi, 11 );
%
%  There are two choices for specifying y_init:
%  1) y_init can be a vector, containing a constant value for each component of y.
%  2) y_init can be a function which returns the guess value for the components of y
%     at a point x.
%  It is NOT possible to specify an M by N vector of values of the M components
%  of Y at each of the N values X.
%
  solinit = bvpinit ( x_init, @example3_init, lambda );
%
%  Have BVP4C solve the problem.
%
  sol = bvp4c ( @example3_ode, @example3_bc, solinit );
%
%  Use DEVAL to evaluate the solution.
%
  x = linspace ( 0.0, pi, 101 );
  y = deval ( sol, x );
  lambda_computed = sol.parameters;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Computed eigenvalue lambda = %g\n', lambda_computed );
%
%  Display a plot of Y and Y'.
%
  plot ( x, y(1,:), 'r-', 'Linewidth', 2 );
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y(X) --->', 'Fontsize', 16 );
  title ( 'EXAMPLE3: Eigenfunction 4 of Mathieu''s Equation', 'Fontsize', 16 )
  grid on
  filename = 'example3.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot file as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE3:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function dydx = example3_ode ( x, y, lambda )

%*****************************************************************************80
%
%% EXAMPLE3_ODE evaluates the right hand side of the ODE.
%
%  Discussion:
%
%    We assume that the differential equation has been rewritten as a
%    system of first order equations of the form
%
%      dydx = f(x,y)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the point at which the ODE is to be evaluated.
%
%    Input, real Y(M), the value of the solution at X.
%
%    Input, real LAMBDA, the estimated eigenvalue.
%
%    Output, real DYDX(M), the value of the right hand side given X and Y.
%
  q = 5.0;

  dydx(1) = y(2);
  dydx(2) = - ( lambda - 2.0 * q * cos ( 2.0 * x ) ) * y(1);

  return
end
function bc = example3_bc ( ya, yb, lambda )

%*****************************************************************************80
%
%% EXAMPLE3_BC evaluates the boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real YA(M), YB(M), the solution value at the left and right endpoints.
%
%    Input, real LAMBDA, the estimated eigenvalue.
%
%    Output, real BC(2), the value of the boundary conditions.
%
  bc(1) = ya(2);
  bc(2) = yb(2);
  bc(3) = ya(1) - 1.0;

  return
end
function y_init = example3_init ( x )

%*****************************************************************************80
%
%% EXAMPLE3_INIT evaluates the initial guess at a point X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the evaluation point.
%
%    Output, real Y_INITC(2), the value of the initial guess.
%
  y_init(1) = cos ( 4.0 * x );
  y_init(2) = - 4.0 * sin ( 4.0 * x );

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
