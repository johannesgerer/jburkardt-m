function lagrange_interp_1d_test03 ( prob, m, nd )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_1D_TEST03 tests LAGRANGE_APPROX_1D with Chebyshev spaced data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem index.
%
%    Input, integer M, the polynomial approximant degree.
%
%    Input, integer ND, the number of data points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_1D_TEST03:\n' );
  fprintf ( 1, '  Approximate Chebyshev-spaced data from TEST_INTERP_1D problem #%d.\n', prob );
  fprintf ( 1, '  Use polynomial approximant of degree %d.\n', m );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  a = 0.0;
  b = 1.0;
  xd = r8vec_chebyspace ( nd, a, b );

  yd = p00_f ( prob, nd, xd );

  if ( nd < 10 )
    r8vec2_print ( nd, xd, yd, '  Data array:' );
  end
%
%  #1:  Does interpolant match function at interpolation points?
%
  ni = nd;
  xi = xd;
  yi = lagrange_approx_1d ( m, nd, xd, yd, ni, xi );

  int_error = norm ( yi - yd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 approximation error averaged per data node = %g\n', int_error );
%
%  #2: Plot the piecewise linear interpolant and polynomial approximants.
%
  figure ( 1 );
  clf
  ni = 501;
  xi = r8vec_linspace ( ni, a, b );
  yi = lagrange_approx_1d ( m, nd, xd, yd, ni, xi );

  hold on
  plot ( xd, yd, 'k.', 'Markersize', 30 );
  plot ( xd, yd, 'b-', 'Linewidth', 3 );
  plot ( xi, yi, 'r-', 'Linewidth', 4 );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( sprintf ( 'Lagrange/Chebyshev Polynomial Approximant of degree %d for %d nodes', m, nd ) )
  grid on
  hold off

  filename = sprintf ( 'p%02d_lagcheby_%02d_%02d.png', prob, m, nd );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
