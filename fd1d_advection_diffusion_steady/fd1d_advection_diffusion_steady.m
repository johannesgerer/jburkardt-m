function fd1d_advection_diffusion_steady ( )

%*****************************************************************************80
%
%% FD1D_ADVECTION_DIFFUSION_STEADY solves steady advection diffusion equation.
%
%  Discussion:
%
%    The steady advection diffusion equation has the form:
%
%      v ux - k * uxx = 0
%
%    where V (the advection velocity) and K (the diffusivity) are positive 
%    constants, posed in the region
%
%      a = 0 < x < 1 = b
%
%    with boundary conditions
%
%      u(0) = 0, u(1) = 1.
%
%    The discrete solution is unreliable when dx > 2 * k / v / ( b - a ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Charles Hall, Thomas Porsching,
%    Numerical Analysis of Partial Differential Equations,
%    Prentice-Hall, 1990,
%    ISBN: 013626557X,
%    LC: QA374.H29.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_ADVECTION_DIFFUSION_STEADY:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the 1D steady advection diffusion equation:\n' );
  fprintf ( 1, '    v du/dx - k d2u/dx2 = 0\n' );
  fprintf ( 1, '  with constant, positive velocity V and diffusivity K,\n' );
  fprintf ( 1, '  over the interval:\n' );
  fprintf ( 1, '    0.0 <= x <= 1.0\n' );
  fprintf ( 1, '  with boundary conditions:\n' );
  fprintf ( 1, '    u(0) = 0, u(1) = 1.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use finite differences:\n' );
  fprintf ( 1, '    d u/dx  = (u(x+dx)-u(x-dx))/2/dx\n' );
  fprintf ( 1, '    d2u/dx2 = (u(x+dx)-2u(x)+u(x-dx))/dx^2\n' );
%
%  Physical constants.
%
  v = 1.0;
  k = 0.05;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Diffusivity K = %g\n', k );
  fprintf ( 1, '  Constant velocity V = %g\n', v );
%
%  Spatial discretization.
%
  nx = 41;
  a = 0.0;
  b = 1.0;
  dx = ( b - a ) / ( nx - 1 );
  x = ( linspace ( a, b, nx ) )';

  fprintf ( 1, '  Number of nodes NX = %d\n', nx );
  fprintf ( 1, '  DX = %g\n', dx );
  fprintf ( 1, '  Maximum safe DX is %g\n', 2 * k / v / ( b - a ) );
%
%  Set up linear system corresponding to boundary conditions and
%  advection-diffusion equation.
%
  A = sparse ( nx, nx );
  f = zeros ( nx, 1 );

  A(1,1) = 1.0;
  f(1) = 0.0;

  for i = 2 : nx - 1
    A(i,i-1) = - v / dx / 2.0 -       k / dx / dx;
    A(i,i)   =                + 2.0 * k / dx / dx;
    A(i,i+1) = + v / dx / 2.0 -       k / dx / dx;
    f(i) = 0.0;
  end

  A(nx,nx) = 1.0;
  f(nx) = 1.0;
%
%  Solve linear system for U.
%
  u = A \ f;
%
%  The exact solution to the differential equation is known.
%
  r = v * ( b - a ) / k;
  w = ( 1.0 - exp ( r * x ) ) / ( 1.0 - exp ( r ) );
%
%  Plot discrete solution U (dots) and exact solution W (line).
%
  hold on
  plot ( x, w, 'b-', 'LineWidth', 2 );
  plot ( x, u, 'r.', 'LineWidth', 2, 'Markersize', 20 );

  grid on
  xlabel ( '<--X-->', 'Fontsize', 16 );
  ylabel ( '<--U(X)-->', 'Fontsize', 16 );
  title ( 'Solution of Steady Advection-Diffusion Equation', 'Fontsize', 24);
  hold off

  filename = 'fd1d_advection_diffusion_steady.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot as "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_ADVECTION_DIFFUSION_STEADY\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

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
