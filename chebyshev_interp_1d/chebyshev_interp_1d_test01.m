function chebyshev_interp_1d_test01 ( prob )

%*****************************************************************************80
%
%% CHEBYSHEV_INTERP_1D_TEST01 tests CHEBYSHEV_VALUE_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 September 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_INTERP_1D_TEST01:\n' );
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
  yi = chebyshev_interp_1d ( nd, xd, yd, ni, xi );

  int_error = norm ( yi - yd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 interpolation error averaged per interpolant node = %g\n', int_error );
%
%  #2: Compare estimated curve length to piecewise linear (minimal) curve length.
%  Assume data is sorted, and normalize X and Y dimensions by (XMAX-XMIN) and
%  (YMAX-YMIN).
%
  xmin = min ( xd(1:nd) );
  xmax = max ( xd(1:nd) );
  ymin = min ( yd(1:nd) );
  ymax = max ( yd(1:nd) );

  ni = 501;
  xi = r8vec_linspace ( ni, xmin, xmax );
  yi = chebyshev_interp_1d ( nd, xd, yd, ni, xi );

  ld = sum ( sqrt ( ( ( xd(2:nd) - xd(1:nd-1) ) / ( xmax - xmin ) ).^2 ...
                  + ( ( yd(2:nd) - yd(1:nd-1) ) / ( ymax - ymin ) ).^2 ) );

  li = sum ( sqrt ( ( ( xi(2:ni) - xi(1:ni-1) ) / ( xmax - xmin ) ).^2 ...
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
  title ( 'Piecewise Linear Interpolant' )
  grid on
  hold off
  filename = sprintf ( 'p%02d_data.png', prob );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plot file "%s".\n', filename );
%
%  #4: Plot the piecewise linear and polynomial interpolants.
%
  figure ( 2 );
  clf
  ni = 101;
  xmin = min ( xd );
  xmax = max ( xd );
  xi = r8vec_linspace ( ni, xmin, xmax );
  yi = chebyshev_interp_1d ( nd, xd, yd, ni, xi );

  hold on
  plot ( xi, yi, 'r-', 'Linewidth', 3 );
  plot ( xd, yd, 'b-', 'Linewidth', 3 );
  plot ( xd, yd, 'k.', 'Markersize', 20 );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( 'Polynomial Interpolant using Lagrange' )
  grid on
  hold off

  filename = sprintf ( 'p%02d_poly.png', prob );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
