function gnuplot_stokes3_test ( )

%*****************************************************************************80
%
%% GNUPLOT_STOKES3_TEST plots solution #3 on a regular grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GNUPLOT_STOKES3_TEST:\n' );
  fprintf ( 1, '  Exact Stokes solution #3:\n' );
  fprintf ( 1, '  Generate a Stokes velocity field on [-1,+1]x[-1,+1].\n' );
  fprintf ( 1, '  Store in GNUPLOT data and command files.\n' );

  x_num = 21;   
  x_lo = -1.0;
  x_hi = +1.0;

  y_num = 21;
  y_lo = -1.0;
  y_hi = +1.0;

  [ x, y ] = grid_2d ( x_num, x_lo, x_hi, y_num, y_lo, y_hi );

  n = x_num * y_num;

  [ u, v, p ] = uvp_stokes3 ( n, x, y );

  header = 'stokes3';
  s = 0.05;
  stokes_gnuplot ( header, n, x, y, u, v, s )

  return
end
