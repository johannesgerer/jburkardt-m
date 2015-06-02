function gnuplot_taylor_test ( )

%*****************************************************************************80
%
%% GNUPLOT_TAYLOR_TEST generates a field on a regular grid and plots it.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/navier_stokes_2d_exact/gnuplot_taylor_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GNUPLOT_TAYLOR_TEST:\n' );
  fprintf ( 1, '  Taylor Vortex Flow:\n' );
  fprintf ( 1, '  Generate a velocity field on a regular grid.\n' );
  fprintf ( 1, '  Store in GNUPLOT data and command files.\n' );

  x_lo = 0.5;
  x_hi = 2.5;
  x_num = 21;

  y_lo = 0.5;
  y_hi = 2.5;
  y_num = 21;

  [ x, y ] = grid_2d ( x_num, x_lo, x_hi, y_num, y_lo, y_hi );

  nu = 1.0;
  rho = 1.0;
  n = x_num * y_num;
  t = 0.0;

  [ u, v ] = uvp_taylor ( nu, rho, n, x, y, t );

  header = 'taylor';
  s = 0.10;
  ns2de_gnuplot ( header, n, x, y, u, v, s );

  return
end

