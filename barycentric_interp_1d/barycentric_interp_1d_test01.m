function barycentric_interp_1d_test01 ( prob, nd )

%*****************************************************************************80
%
%% BARYCENTRIC_INTERP_1D_TEST01 tests LAGCHEBY1_INTERP_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Input, integer ND, the number of data points to use.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BARYCENTRIC_INTERP_1D_TEST01:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_1D problem #%d.\n', prob );
  fprintf ( 1, '  Use Chebyshev Type 1 spacing for data points.\n' );
  fprintf ( 1, '  Number of data points = %d\n', nd );
%
%  Define the data.
%
  a =  0.0;
  b = +1.0;
  xd = r8vec_cheby1space ( nd, a, b );
  yd = p00_f ( prob, nd, xd );

  if ( nd < 10 )
    r8vec2_print ( nd, xd, yd, '  Data array:' );
  end
%
%  #1:  Does the interpolant match the function at the interpolation points?
%
  ni = nd;
  xi = xd;
  yi = lagcheby1_interp_1d ( nd, xd, yd, ni, xi );

  int_error = norm ( yi - yd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 interpolation error averaged per interpolant node = %g\n', int_error );
%
%  #2: Plot the data.
%
  ni = 500;
  xi = r8vec_linspace ( ni, a, b );
  yi = lagcheby1_interp_1d ( nd, xd, yd, ni, xi );

  clf
  hold on
  plot ( xd, yd, 'b.', 'MarkerSize', 30 );
  plot ( xi, yi, 'r-', 'LineWidth', 3 );
  grid on
  xlabel ( '<---X--->' );
  ylabel ( '<---Y--->' );
  title ( sprintf ( 'Barycentric Lagrange Chebyshev1 Interpolant for %d nodes', nd ) )
  hold off

  filename = sprintf ( 'p%02d_lagcheby1_%02d.png', prob, nd );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
