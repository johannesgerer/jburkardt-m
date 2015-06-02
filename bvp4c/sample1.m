function sample1 ( )

%*****************************************************************************80
%
%% SAMPLE1 uses BVP4C to solve the SAMPLE1 problem.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SAMPLE1:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use BVP4C to solve the following boundary value problem:\n' );
  fprintf ( 1, '  y" + abs(y) = 0\n' );
  fprintf ( 1, '  y(0) = 0, y(4) = -2\n' );
  fprintf ( 1, '  Use initial guesses y(x) = 1, y''(x) = 0.\n' );
%
%  Set SOLINIT, the structure defining the initial guess.
%
  x_init = linspace ( 0.0, 4.0, 5 );
%
%  There are two choices for specifying y_init:
%  1) y_init can be a vector, containing a constant value for each component of y.
%  2) y_init can be a function which returns the guess value for the components of y
%     at a point x.
%  It is NOT possible to specify an M by N vector of values of the M components
%  of Y at each of the N values X.
%
  y_init = [ 1.0, 0.0 ];
  solinit = bvpinit ( x_init, y_init );
%
%  Have BVP4C solve the problem.
%
  sol = bvp4c ( @sample1_ode, @sample1_bc, solinit );
%
%  Use DEVAL to evaluate the solution.
%
  x = linspace ( 0.0, 4.0, 101 );
  y = deval ( sol, x );
%
%  Display a plot of Y and Y'.
%
  plot ( x, y(1,:), 'r-', x, y(2,:), 'b-', 'Linewidth', 2 );
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y(X) --->', 'Fontsize', 16 );
  title ( 'SAMPLE1: Y (red), Y'' (blue)', 'Fontsize', 16 )
  grid on
  filename = 'sample1.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot file as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SAMPLE1:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function dydx = sample1_ode ( x, y )

%*****************************************************************************80
%
%% SAMPLE1_ODE evaluates the right hand side of the ODE.
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
%    Output, real DYDX(M), the value of the right hand side given X and Y.
%
  dydx(1) = y(2);
  dydx(2) = - abs ( y(1) );

  return
end
function bc = sample1_bc ( ya, yb )

%*****************************************************************************80
%
%% SAMPLE1_BC evaluates the boundary conditions.
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
%    Output, real BC(2), the value of the boundary conditions.
%
  bc(1) = ya(1);
  bc(2) = yb(1) + 2.0;

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