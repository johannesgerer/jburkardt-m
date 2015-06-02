function example2 ( )

%*****************************************************************************80
%
%% EXAMPLE2 uses BVP4C to solve the EXAMPLE2 problem.
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
%  Reference:
%
%    Lawrence Shampine, Jacek Kierzenka, Mark Reichelt,
%    Solving boundary value problems for ordinary differential equations
%    in MATLAB with bvp4c.
%
  global p

  p = 0.00001;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE2:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use BVP4C to solve the following boundary value problem:\n' );
  fprintf ( 1, '  y" + 3 p y / ( p + t^2 )^2 = 0\n' );
  fprintf ( 1, '  y(-0.1) = -0.1 / sqrt ( p + 0.01 )\n' );
  fprintf ( 1, '  y(+0.1) = +0.1 / sqrt ( p + 0.01 )\n' );
  fprintf ( 1, '  Use initial guesses:\n' );
  fprintf ( 1, '  y(x) = 0\n' );
  fprintf ( 1, '  y''(x) = 10\n' );
  fprintf ( 1, '  Use parameter value p = %g\n', p );
%
%  Set SOLINIT, the structure defining the initial guess.
%
  x_init = linspace ( -0.1, 0.1, 11 );
  y_init = [ 0.0, 10.0 ];
  solinit = bvpinit ( x_init, y_init );
%
%  Because this problem is difficult to solve accurately, we must request
%  a more stringent tolerance.  This is done through the optional OPTIONS
%  input.
%
  options = bvpset ( 'RelTol', 1.0E-04 );
%
%  Have BVP4C solve the problem.
%
  sol = bvp4c ( @example2_ode, @example2_bc, solinit, options );
%
%  Use DEVAL to evaluate the solution.
%
  x = linspace ( -0.1, 0.1, 101 );
  sol = deval ( sol, x );

  exact = x ./ sqrt ( p + x.^2 );
%
%  Display a plot of Y and the exact solution.
%
  plot ( x, sol(1,:), 'b*', ...
         x, exact, 'r-', 'Linewidth', 2 );
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y(X) --->', 'Fontsize', 16 );
  title ( 'EXAMPLE2: Exact solution (red), Estimate (blue)', 'Fontsize', 16 )
  grid on
  filename = 'example2.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot file as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE2:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function dydx = example2_ode ( x, y )

%*****************************************************************************80
%
%% EXAMPLE2_ODE evaluates the right hand side of the ODE.
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
%    07 September 2013
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
  global p

  dydx(1) = y(2);
  dydx(2) = - 3.0 * p * y(1) / ( p + x^2 )^2;

  return
end
function bc = example2_bc ( ya, yb )

%*****************************************************************************80
%
%% EXAMPLE2_BC evaluates the boundary conditions.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, real YA(M), YB(M), the solution value at the left and right endpoints.
%
%    Output, real BC(M), the value of the boundary conditions.
%
  global p

  bc(1) = ya(1) + 0.1 / sqrt ( p + 0.01 );
  bc(2) = yb(1) - 0.1 / sqrt ( p + 0.01 );

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
