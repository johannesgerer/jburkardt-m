function lagrange_interp_1d_test03 ( prob, nd )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_1D_TEST03 tests LAGRANGE_VALUE_1D with Chebyshev spaced data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2012
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
  fprintf ( 1, 'LAGRANGE_INTERP_1D_TEST03:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_1D problem #%d.\n', prob );
  fprintf ( 1, '  Use Chebyshev spacing for data points.\n' );
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
  yi = lagrange_value_1d ( nd, xd, yd, ni, xi );

  int_error = norm ( yi - yd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 interpolation error averaged per interpolant node = %g\n', int_error );
%
%  #2: Compare estimated curve length to piecewise linear (minimal) curve length.
%  Assume data is sorted, and normalize X and Y dimensions by (XMAX-XMIN) and
%  (YMAX-YMIN).
%
  ymin = min ( yd(1:nd) );
  ymax = max ( yd(1:nd) );

  ni = 501;
  xi = r8vec_linspace ( ni, a, b );
  yi = lagrange_value_1d ( nd, xd, yd, ni, xi );

  ld = sum ( sqrt ( ( ( xd(2:nd) - xd(1:nd-1) ) / ( b - a ) ).^2 ...
                  + ( ( yd(2:nd) - yd(1:nd-1) ) / ( ymax - ymin ) ).^2 ) );

  li = sum ( sqrt ( ( ( xi(2:ni) - xi(1:ni-1) ) / ( b - a ) ).^2 ...
                  + ( ( yi(2:ni) - yi(1:ni-1) ) / ( ymax - ymin ) ).^2 ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Normalized length of piecewise linear interpolant = %g\n', ld );
  fprintf ( 1, '  Normalized length of polynomial interpolant       = %g\n', li );
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
  title ( sprintf ( 'Interpolation data at %d Chebyshev nodes', nd ) )
  grid on
  hold off
  filename = sprintf ( 'p%02d_datacheby_%02d.png', prob, nd );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plot file "%s".\n', filename );
%
%  #4: Plot the piecewise linear and polynomial interpolants.
%
  figure ( 2 );
  clf
  ni = 501;
  xi = r8vec_linspace ( ni, a, b );
  yi = lagrange_value_1d ( nd, xd, yd, ni, xi );

  hold on
  plot ( xd, yd, 'b-', 'Linewidth', 3 );
  plot ( xi, yi, 'r-', 'Linewidth', 4 );
  plot ( xd, yd, 'k.', 'Markersize', 20 );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( sprintf ( 'Lagrange/Chebyshev Polynomial Interpolant for %d nodes', nd ) )
  grid on
  hold off

  filename = sprintf ( 'p%02d_lagcheby_%02d.png', prob, nd );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
