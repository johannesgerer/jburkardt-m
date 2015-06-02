function example4 ( )

%*****************************************************************************80
%
%% EXAMPLE4 uses BVP4C to solve the EXAMPLE4 problem.
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE4:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Use BVP4C to solve a boundary value problem with\n' );
  fprintf ( 1, '  a periodic solution of unknown period P.\n' );
  fprintf ( 1, '  We solve this on [0,1], with P an additional unknown.\n' );
  fprintf ( 1, '  y'' = 3 ( y + z - y^3/3 - 1.3\n' );
  fprintf ( 1, '  z'' = - ( y - 0.7 + 0.8 * z ) / 3\n' );
  fprintf ( 1, '  y(0) = y(P), z(0) = z(P)\n' );
  fprintf ( 1, '  Use initial guess y = sin ( 2 pi x ), z = cos ( 2 pi x ).\n' );
%
%  Set SOLINIT, the structure defining the initial guess.
%
  x_init = linspace ( 0.0, 1.0, 5 );
  p_init = 2.0 * pi;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial estimate for P is %g\n', p_init );
  solinit = bvpinit ( x_init, @example4_init, p_init );
%
%  Have BVP4C solve the problem.
%
  sol = bvp4c ( @example4_ode, @example4_bc, solinit );
%
%  Retrieve the updated value of the period.
%
  p = sol.parameters;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Period P = %g\n', p );
%
%  Use DEVAL to evaluate the solution.
%
  x = linspace ( 0.0, 1.0, 101 );
  px = p * x;
  sol = deval ( sol, x );
%
%  Evaluate the initial guess on the initial grid [0,1].
%
  y_init = example4_init ( x );
%
%  Display a plot of Y versus initial guess.
%
  plot ( px, sol(1,:), 'r-', ...
         px, y_init(1,:), 'g-', 'Linewidth', 2 );
  xlabel ( '<--- X --->', 'Fontsize', 16 );
  ylabel ( '<--- Y --->', 'Fontsize', 16 );
  title ( 'EXAMPLE4: Y(red) versus initial guess (green)', 'Fontsize', 16 )
  grid on
  filename = 'example4.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot file as "%s"\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXAMPLE4:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function y = example4_init ( x )

%*****************************************************************************80
%
%% EXAMPLE4_INIT evaluates the initial guess for the solution.
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
%    Output, real Y(M,1), the value of the initial guess.
%
  y(1,:) = sin ( 2.0 * pi * x );
  y(2,:) = cos ( 2.0 * pi * x );

  return
end
function dydx = example4_ode ( x, y, p )

%*****************************************************************************80
%
%% EXAMPLE4_ODE evaluates the right hand side of the ODE.
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
%    Input, real P, the estimate for the period.
%
%    Output, real DYDX(M), the value of the right hand side given X and Y.
%
  dydx(1,1) = p * 3.0 * ( y(1) + y(2) - ( y(1) )^3 / 3.0 - 1.3 );
  dydx(2,1) =  - p * ( y(1) - 0.7 + 0.8 * y(2) ) / 3.0;

  return
end
function bc = example4_bc ( ya, yb, p )

%*****************************************************************************80
%
%% EXAMPLE4_BC evaluates the boundary conditions.
%
%  Discussion:
%
%    The third boundary condition applies the phase condition, and eliminates
%    the spurious solution y'(x) = 0, and solutions with p = 0.
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
%    Input, real P, the estimate for the period.
%
%    Output, real BC(M), the value of the boundary conditions.
%
  bc(1,1) = ya(1) - yb(1);
  bc(2,1) = ya(2) - yb(2);
  bc(3,1) = p * ( ya(1) - 0.7 + 0.8 * ya(2) ) / 3.0 - 1.0;

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
