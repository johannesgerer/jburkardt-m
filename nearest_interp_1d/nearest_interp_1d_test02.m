function nearest_interp_1d_test02 ( prob )

%*****************************************************************************80
%
%% NEAREST_INTERP_1D_TEST02 tests NEAREST_INTERP_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the index of the problem.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEAREST_INTERP_1D_TEST02:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP problem #%d.\n', prob );

  nd = p00_data_num ( prob );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  xy = p00_data ( prob, 2, nd );
  
  r8mat_transpose_print ( 2, nd, xy, '  Data array:' );

  xd = reshape ( xy(1,1:nd), nd, 1 );
  yd = reshape ( xy(2,1:nd), nd, 1 );
%
%  #1:  Does interpolant match function at interpolation points?
%
  ni = nd;
  xi = xd;
  yi = nearest_interp_1d ( nd, xd, yd, ni, xi );

  int_error = norm ( yi - yd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 interpolation error averaged per interpolant node = %g\n', int_error );
%
%  #3: Plot the data.
%
  figure ( 1 );
  clf
  hold on
  plot ( xd, yd, 'b-', 'Linewidth', 3 );
  plot ( xd, yd, 'k.', 'Markersize', 20 );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'Piecewise Linear Interpolant' )
  grid on
  hold off
  filename = sprintf ( 'p%02d_data.png', prob );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plot file "%s".\n', filename );
%
%  #4: Plot the piecewise linear and nearest neighbor interpolants.
%
  figure ( 2 );
  clf
  ni = 501;
  xmin = min ( xd );
  xmax = max ( xd );
  xi = r8vec_linspace ( ni, xmin, xmax );
  yi = nearest_interp_1d ( nd, xd, yd, ni, xi );

  hold on
  plot ( xd, yd, 'b-', 'Linewidth', 2 );
  plot ( xi, yi, 'r-', 'Linewidth', 4 );
  plot ( xd, yd, 'k.', 'Markersize', 20 );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'Nearest Neighbor Interpolant' )
  grid on
  hold off

  filename = sprintf ( 'p%02d_nearest.png', prob );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
