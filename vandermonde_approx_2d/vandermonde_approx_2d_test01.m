function vandermonde_approx_2d_test01 ( prob, grd, m )

%*****************************************************************************80
%
%% VANDERMONDE_APPROX_2D_TEST01 tests VANDERMONDE_APPROX_2D_MATRIX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem number.
%
%    Input, integer GRD, the grid number.
%    (Can't use GRID as the name because that's also a plotting function.)
%
%    Input, integer M, the total polynomial degree.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_APPROX_2D_TEST01:\n' );
  fprintf ( 1, '  Approximate data from TEST_INTERP_2D problem #%d.\n', prob );
  fprintf ( 1, '  Use grid from TEST_INTERP_2D with index #%d.\n', grd );
  fprintf ( 1, '  Using polynomial approximant of total degree %d\n', m );

  nd = g00_size ( grd );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  [ xd, yd ] = g00_xy ( grd, nd );

  zd = f00_f0 ( prob, nd, xd, yd );

  if ( nd < 10 )
    r8vec3_print ( nd, xd, yd, zd, '  X, Y, Z data:' );
  end
%
%  Compute the Vandermonde matrix.
%
  tm = triangle_num ( m + 1 );
  A = vandermonde_approx_2d_matrix ( nd, m, tm, xd, yd );
%
%  Solve linear system.
%
  c = A \ zd;
%
%  #1:  Does approximant match function at data points?
%
  ni = nd;
  xi = xd;
  yi = yd;
  zi = r8poly_value_2d ( m, c, ni, xi, yi );

  app_error = norm ( zi - zd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 data approximation error = %g\n', app_error );
%
%  #2: Plot the piecewise linear interpolant.
%
  figure ( 1 );

  clf

  hold on

  tri = delaunay ( xd, yd );
  h = trisurf ( tri, xd, yd, zd );
  ft = f00_title ( prob );
  title ( ft );
  grid on
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<---Z(X,Y)--->' );
  l = light ( 'Position', [ 0, 0, 25 ] );
  set ( gca, 'CameraPosition', [ -10, -10, 20 ] );
  lighting phong
  shading interp

  hold off
 
  filename = sprintf ( 'p%02d_data.png', prob );
  print ( '-dpng', filename );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created plot file "%s".\n', filename );
%
%  #3: Plot the polynomial approximant on a regular grid.
%
  figure ( 2 );
  clf
  nix = 21;
  niy = 21;
  xmin = min ( xd );
  xmax = max ( xd );
  ymin = min ( yd );
  ymax = max ( yd );
  xi = linspace ( xmin, xmax, nix );
  yi = linspace ( ymin, ymax, niy );

  [XI,YI] = meshgrid ( xi, yi );
  NI = nix * niy;
  XI = reshape ( XI, NI, 1 );
  YI = reshape ( YI, NI, 1 );
  ZI = r8poly_value_2d ( m, c, NI, XI, YI );
  XI = reshape ( XI, nix, niy );
  YI = reshape ( YI, nix, niy );
  ZI = reshape ( ZI, nix, niy );
 
  surf ( XI, YI, ZI );

  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<---Z(X,Y)--->' );
  title ( sprintf ( 'Vandermonde Polynomial Approximant for problem %d of degree %d', prob, m ) );
  grid on
  hold off

  filename = sprintf ( 'p%02d_poly%02d.png', prob, m );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
