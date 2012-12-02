function vandermonde_approx_1d_test01 ( prob, m )

%*****************************************************************************80
%
%% VANDERMONDE_APPROX_1D_TEST01 tests VANDERMONDE_APPROX_1D_MATRIX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem number.
%
%    Input, integer M, the polynomial degree.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_APPROX_1D_TEST01:\n' );
  fprintf ( 1, '  Approximate data from TEST_INTERP problem #%d.\n', prob );

  nd = p00_data_num ( prob );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  xy = p00_data ( prob, 2, nd );
  
  r8mat_transpose_print ( 2, nd, xy, '  Data array:' );

  xd = reshape ( xy(1,1:nd), nd, 1 );
  yd = reshape ( xy(2,1:nd), nd, 1 );
%
%  Compute the Vandermonde matrix.
%
  fprintf ( 1, '  Using polynomial approximant of degree %d\n', m );

  A = vandermonde_approx_1d_matrix ( nd, m, xd );
%
%  Solve linear system.
%
  c = A \ yd;
%
%  #1:  Does approximant match function at data points?
%
  ni = nd;
  xi = xd;
  yi = r8poly_value ( m, c, ni, xi );

  app_error = norm ( yi - yd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 data approximation error = %g\n', app_error );
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
  yi = r8poly_value ( m, c, ni, xi );

  ld = sum ( sqrt ( ( ( xd(2:nd) - xd(1:nd-1) ) / ( xmax - xmin ) ).^2 ...
                  + ( ( yd(2:nd) - yd(1:nd-1) ) / ( ymax - ymin ) ).^2 ) );

  li = sum ( sqrt ( ( ( xi(2:ni) - xi(1:ni-1) ) / ( xmax - xmin ) ).^2 ...
                  + ( ( yi(2:ni) - yi(1:ni-1) ) / ( ymax - ymin ) ).^2 ) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Normalized length of piecewise linear interpolant = %g\n', ld );
  fprintf ( 1, '  Normalized length of polynomial approximant       = %g\n', li );
%
%  #3: Plot the piecewise linear interpolant.
%
  if ( m == 1 )
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
  end
%
%  #4: Plot the piecewise linear interpolant and polynomial approximant.
%
  figure ( 2 );
  clf
  ni = 101;
  xmin = min ( xd );
  xmax = max ( xd );
  xi = r8vec_linspace ( ni, xmin, xmax );
  yi = r8poly_value ( m, c, ni, xi );

  hold on
  plot ( xi, yi, 'r-', 'Linewidth', 3 );
  plot ( xd, yd, 'b-', 'Linewidth', 3 );
  plot ( xd, yd, 'k.', 'Markersize', 20 );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  title ( sprintf ( 'Vandermonde Polynomial Approximant of degree %d', m ) );
  grid on
  hold off

  filename = sprintf ( 'p%02d_poly%02d.png', prob, m );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
