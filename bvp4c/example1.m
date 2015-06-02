function example1 ( )

%*****************************************************************************80
%
%% EXAMPLE1 uses BVP4C to solve the EXAMPLE1 problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2013
%
%  Author:
%
%    Original MATLAB version by Shampine, Kierzenka, Reichelt.
%    This version by John Burkardt.
%
%  Reference:
%
%    Lawrence Shampine, Jacek Kierzenka, Mark Reichelt,
%    Solving boundary value problems for ordinary differential equations
%    in MATLAB with bvp4c.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE1:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use BVP4C to solve the following boundary value problem:\n' );
  fprintf ( 1, '  u'' = 0.5 * u * ( w - u ) / v\n' );
  fprintf ( 1, '  v'' = - 0.5 * ( w - u )\n' );
  fprintf ( 1, '  w'' = ( 0.9 - 1000 * ( 2 - y ) - 0.5 * w * ( w - u ) ) / z\n' );
  fprintf ( 1, '  z'' = 0.5 * ( w - u )\n' );
  fprintf ( 1, '  y'' = - 100 * ( y - w )\n' );
  fprintf ( 1, '  u(0) = v(0) = w(0) = 1\n' );
  fprintf ( 1, '  z(0) = - 10\n' );
  fprintf ( 1, '  w(1) - y(1) = 0.0\n' );
  fprintf ( 1, '  Use initial guesses:\n' );
  fprintf ( 1, '  u(x) = 1\n' );
  fprintf ( 1, '  v(x) = 1\n' );
  fprintf ( 1, '  w(x) = -4.5 * x^2 + 8.91 * x + 1\n' );
  fprintf ( 1, '  z(x) = -10\n' );
  fprintf ( 1, '  y(x) = - 4.5 * x^2 + 9 * x + 0.91\n' );
%
%  Set SOLINIT, the structure defining the initial guess.
%
  x_init = linspace ( 0.0, 1.0, 5 );
%
%  There are two choices for specifying y_init:
%  1) y_init can be a vector, with a constant value for each component of y.
%  2) y_init can be a function returning the guess value for the components of y
%     at a point x.
%  It is NOT possible to specify an M by N vector of values of the M components
%  of Y at each of the N values X.
%
%  Although our initial guess functions are more complicated, we just use
%  the constant value associated with x = 0.
%
  y_init = [ 1.0, 1.0, 1.0, -10.0, 0.91 ];
  solinit = bvpinit ( x_init, y_init );
%
%  Have BVP4C solve the problem.
%
  sol = bvp4c ( @example1_ode, @example1_bc, solinit );
%
%  Use DEVAL to evaluate the solution.
%
  x = linspace ( 0.0, 1.0, 101 );
  sol = deval ( sol, x );
%
%  Display a plot of U, V, W, Z, Y.
%
  plot ( x, sol(1,:), 'r-', ...
         x, sol(2,:), 'g-', ...
         x, sol(3,:), 'b-', ...
         x, sol(4,:), 'c-', ...
         x, sol(5,:), 'm-', 'Linewidth', 2 );
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- U/V/W/Z/Y --->', 'Fontsize', 16 );
  title ( 'EXAMPLE1: U/V/W/Z/Y RGBCM', 'Fontsize', 16 )
  grid on
  filename = 'example1.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot file as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE1:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function dydx = example1_ode ( x, y )

%*****************************************************************************80
%
%% EXAMPLE1_ODE evaluates the right hand side of the ODE.
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
%    05 September 2013
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
%    Output, real DYDX(M), the value of the right hand side given X and Y.
%
  dydx(1) = 0.5 * y(1) * ( y(3) - y(1) ) / y(2);
  dydx(2) = - 0.5 * ( y(3) - y(1) );
  dydx(3) = ( 0.9 - 1000.0 * ( y(3) - y(5) ) - 0.5 * y(3) * ( y(3) - y(1) ) ) / y(4);
  dydx(4) = 0.5 * ( y(3) - y(1) );
  dydx(5) = 100.0 * (  y(3) - y(5) );

  return
end
function bc = example1_bc ( ya, yb )

%*****************************************************************************80
%
%% EXAMPLE1_BC evaluates the boundary conditions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real YA(M), YB(M), the solution value at the left and right endpoints.
%
%    Output, real BC(M), the value of the boundary conditions.
%
  bc(1) = ya(1) - 1.0;
  bc(2) = ya(2) - 1.0;
  bc(3) = ya(3) - 1.0;
  bc(4) = ya(4) + 10.0;
  bc(5) = yb(3) - yb(5);

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
