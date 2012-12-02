function pwl_approx_1d_test01 ( prob, nc, nd )

%*****************************************************************************80
%
%% PWL_APPROX_1D_TEST01 tests PWL_APPROX_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Input, integer NC, the number of control points.
%
%    Input, integer ND, the number of data points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_APPROX_1D_TEST01:\n' );
  fprintf ( 1, '  Approximate data from TEST_INTERP_1D problem #%d.\n', prob );
  fprintf ( 1, '  Number of control points = %d\n', nc );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  xmin = 0.0;
  xmax = 1.0;

  xd = r8vec_linspace ( nd, xmin, xmax );
  yd = p00_f ( prob, nd, xd );
  if ( nd < 10 )
    r8vec2_print ( nd, xd, yd, '  Data array:' );
  end
%
%  Determine control values.
%
  xc = r8vec_linspace ( nc, xmin, xmax );
  yc = pwl_approx_1d ( nd, xd, yd, nc, xc );
%
%  #1:  Does approximant come close to function at data points?
%
  ni = nd;
  xi = xd;
  yi = pwl_interp_1d ( nc, xc, yc, ni, xi );

  app_error = norm ( yi - yd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 approximation error averaged per data node = %g\n', app_error );
%
%  #2: Plot the PWL functions for the data and control values.
%
  figure ( 1 );
  clf
  hold on
  plot ( xc, yc, 'r-', 'Linewidth', 4 );
  plot ( xd, yd, 'k.', 'Markersize', 20 );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'Piecewise Linear Approximant' )
  grid on
  hold off

  filename = sprintf ( 'p%02d_pwl_%02d_%02d.png', prob, nc, nd );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
