function lagrange_interp_2d_test02 ( prob, m )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_2D_TEST02 plots results from LAGRANGE_INTERP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem number.
%
%    Input, integer M, the polynomial degree in each dimension.
%
  mx = m;
  my = m;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_2D_TEST02:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_2D problem #%d.\n', prob );
  fprintf ( 1, '  Using polynomial interpolant of product degree %dx%d\n', mx, my );
  fprintf ( 1, '  Plot the results.\n' );

  nd = ( mx + 1 ) * ( my + 1 );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  xd_1d = r8vec_chebyspace ( mx + 1, 0.0, 1.0 );
  yd_1d = r8vec_chebyspace ( my + 1, 0.0, 1.0 );

  [ xd, yd ] = meshgrid ( xd_1d, yd_1d );

  xd = reshape ( xd, nd, 1 );
  yd = reshape ( yd, nd, 1 );
  zd = f00_f0 ( prob, nd, xd, yd );
  xd = reshape ( xd, mx + 1, my + 1 );
  yd = reshape ( yd, mx + 1, my + 1 );
%
%  #1: Plot the linear interpolant.
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
%  #2: Plot the polynomial interpolant.
%
  figure ( 2 );
  clf
  nix = 21;
  niy = 21;
  xmin = min ( xd_1d );
  xmax = max ( xd_1d );
  ymin = min ( yd_1d );
  ymax = max ( yd_1d );
  xi = linspace ( xmin, xmax, nix );
  yi = linspace ( ymin, ymax, niy );

  [XI,YI] = meshgrid ( xi, yi );
  NI = nix * niy;
  XI = reshape ( XI, NI, 1 );
  YI = reshape ( YI, NI, 1 );

  ZI = lagrange_interp_2d ( mx, my, xd_1d, yd_1d, zd, NI, XI, YI );

  XI = reshape ( XI, nix, niy );
  YI = reshape ( YI, nix, niy );
  ZI = reshape ( ZI, nix, niy );
 
  surf ( XI, YI, ZI );

  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<---Z(X,Y)--->' );
  title ( sprintf ( 'Lagrange Polynomial Interpolant for problem %d of degree %d', prob, m ) );
  grid on
  hold off

  filename = sprintf ( 'p%02d_poly%02d.png', prob, m );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
