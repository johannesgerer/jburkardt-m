function vandermonde_interp_2d_test01 ( prob, m )

%*****************************************************************************80
%
%% VANDERMONDE_INTERP_2D_TEST01 tests VANDERMONDE_INTERP_2D_MATRIX.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem number.
%
%    Input, integer M, the degree of interpolation.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'VANDERMONDE_INTERP_2D_TEST01:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_2D problem #%d.\n', prob );
  fprintf ( 1, '  Create an interpolant of total degree %d.\n', m );
  tmp1 = triangle_num ( m + 1 );
  fprintf ( 1, '  Number of data values needed is %d\n', tmp1 );

  nd = tmp1;

  xd = rand ( nd, 1 );
  yd = rand ( nd, 1 );

  zd = f00_f0 ( prob, nd, xd, yd );

  r8vec3_print ( nd, xd, yd, zd, '  X, Y, Z data:' );
%
%  Compute the Vandermonde matrix.
%
  A = vandermonde_interp_2d_matrix ( nd, m, xd, yd );
%
%  Solve linear system.
%
  c = A \ zd;
%
%  #1:  Does interpolant match function at data points?
%
  ni = nd;
  xi = xd;
  yi = yd;
  zi = r8poly_value_2d ( m, c, ni, xi, yi );

  app_error = norm ( zi - zd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 data interpolation error = %g\n', app_error );
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
%  #3: Plot the polynomial interpolant on a regular grid.
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
  title ( sprintf ( 'Vandermonde Polynomial Interpolant for problem %d of degree %d', prob, m ) );
  grid on
  hold off

  filename = sprintf ( 'p%02d_poly%02d.png', prob, m );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
