function gnuplot_stokes1_test ( )

%*****************************************************************************80
%
%% GNUPLOT_STOKES1_TEST plots solution #1 on a regular grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GNUPLOT_STOKES1_TEST:\n' );
  fprintf ( 1, '  Exact Stokes solution #1:\n' );
  fprintf ( 1, '  Generate a Stokes velocity field on a regular grid.\n' );
  fprintf ( 1, '  Store in GNUPLOT data and command files.\n' );

  x_num = 21;   
  x_lo = 0.0;
  x_hi = 1.0;

  y_num = 21;
  y_lo = 0.0;
  y_hi = 1.0;

  [ x, y ] = grid_2d ( x_num, x_lo, x_hi, y_num, y_lo, y_hi );

  n = x_num * y_num;

  [ u, v, p ] = uvp_stokes1 ( n, x, y );

  header = 'stokes1';
  s = 4.0;
  stokes_gnuplot ( header, n, x, y, u, v, s )

  return
end
