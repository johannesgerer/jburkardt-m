function shepard_interp_2d_test01 ( prob, g, p )

%*****************************************************************************80
%
%% SHEPARD_INTERP_2D_TEST01 tests SHEPARD_INTERP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem number.
%
%    Input, integer G, the grid number.
%
%    Input, real P, the power used in the distance weighting.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHEPARD_INTERP_2D_TEST01:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_2D problem #%d\n', prob );
  fprintf ( 1, '  using grid #%d\n', g );
  fprintf ( 1, '  using Shepard interpolation with P = %g\n', p );

  nd = g00_size ( g );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  [ xd, yd ] = g00_xy ( g, nd );
  
  zd = f00_f0 ( prob, nd, xd, yd );

  if ( p == 1.0 )
    r8vec3_print ( nd, xd, yd, zd, '  X, Y, Z data:' );
  end
%
%  #1:  Does interpolant match function at interpolation points?
%
  ni = nd;
  xi = xd;
  yi = yd;
  zi = shepard_interp_2d ( nd, xd, yd, zd, p, ni, xi, yi );

  int_error = norm ( zi - zd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 interpolation error averaged per interpolant node = %g\n', int_error );
%
%  #2: Plot the linear interpolant.
%
  if ( p == 1.0 )
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
  end
%
%  #3: Plot the Shepard interpolant.
%
  figure ( 2 );
  clf
  nix = 21;
  niy = 21;
  xmin = 0.0;
  xmax = 1.0;
  ymin = 0.0;
  ymax = 1.0;
  xi = linspace ( xmin, xmax, nix );
  yi = linspace ( ymin, ymax, niy );
  [XI,YI] = meshgrid ( xi, yi );
  NI = nix * niy;
  XI = reshape ( XI, NI, 1 );
  YI = reshape ( YI, NI, 1 );
  ZI = shepard_interp_2d ( nd, xd, yd, zd, p, NI, XI, YI );
  XI = reshape ( XI, nix, niy );
  YI = reshape ( YI, nix, niy );
  ZI = reshape ( ZI, nix, niy );
  surf ( XI, YI, ZI );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<---Z(X,Y)--->' );
  title ( sprintf ( 'Shepard interpolant for problem %d with P = %g', prob, p ) )
  grid on
  hold off
  filename = sprintf ( 'p%02d_power%g.png', prob, p );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
