function fd1d_advection_lax_wendroff ( )

%*****************************************************************************80
%
%% FD1D_ADVECTION_LAX_WENDROFF: advection equation using LAX-WENDROFF method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 March 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_ADVECTION_LAX_WENDROFF:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Solve the constant-velocity advection equation in 1D,\n' );
  fprintf ( 1, '    du/dt = - c du/dx\n' );
  fprintf ( 1, '  over the interval:\n' );
  fprintf ( 1, '    0.0 <= x <= 1.0\n' );
  fprintf ( 1, '  with periodic boundary conditions, and\n' );
  fprintf ( 1, '  with a given initial condition\n' );
  fprintf ( 1, '    u(0,x) = (10x-4)^2 (6-10x)^2 for 0.4 <= x <= 0.6\n' );
  fprintf ( 1, '           = 0 elsewhere.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We use the Lax-Wendroff method.\n' );

  nx = 101;
  dx = 1.0 / ( nx - 1 );
  x = linspace ( 0.0, 1.0, nx );
  nt = 1000;
  dt = 1.0 / nt;
  c = 1.0;

  u = zeros ( 1, nx );
  i = find ( 0.4 <= x & x <= 0.6 );
  u(i) = ( 10.0 * x(i) - 4.0 ).^2 .* ( 6.0 - 10.0 * x(i) ).^2;

  iplot = 1;
  uplot(iplot,:) = u(:)';
  tplot(iplot) = 0.0;
  plotstep = ceil ( nt / 50 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of nodes NX = %d\n', nx );
  fprintf ( 1, '  Number of time steps NT = %d\n', nt );
  fprintf ( 1, '  Constant velocity C = %g\n', c );
  fprintf ( 1, '  CFL condition: dt (%g) <= dx / c (%g)\n', dt, dx / c );

  im1 = [ nx, 1:nx-2, nx-1 ];
  i   = [ 1,  2:nx-1, nx   ];
  ip1 = [ 2,  3:nx,   1    ];

  c1 = 0.5 *   c * dt / dx;
  c2 = 0.5 * ( c * dt / dx )^2;

  for j = 1 : nt

    unew(i) = u(i) - c1 * ( u(ip1) - u(im1) ) + c2 * ( u(ip1) - 2.0 * u(i) + u(im1) );
    u(i) = unew(i);

    if ( rem ( j, plotstep ) < 1 )
      iplot = iplot + 1;
      uplot(iplot,:) = u(:)';
      tplot(iplot) = j * dt;
    end

  end
%
%  Plot.
%
  mesh ( x, tplot, uplot );
  xlabel ( '<--X-->' );
  ylabel ( '<--T-->');
  title ( 'U(X,T)');

  filename = 'fd1d_advection_lax_wendroff.png';
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Saving plot as "%s".\n', filename );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FD1D_ADVECTION_LAX_WENDROFF\n' );
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
