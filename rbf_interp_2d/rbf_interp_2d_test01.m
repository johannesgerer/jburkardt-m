function rbf_interp_2d_test01 ( prob, g, phi, phi_name )

%*****************************************************************************80
%
%% RBF_INTERP_2D_TEST01 tests RBF_INTERP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the index of the problem.
%
%    Input, integer G, the index of the grid.
%
%    Input, @ function PHI ( R ), a handle for the radial basis function.
%
%    Input, string PHI_NAME, the name of the radial basis function.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RBF_INTERP_2D_TEST01:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_2D problem #%d\n', prob );
  fprintf ( 1, '  using grid #%d\n', g );
  fprintf ( 1, '  using radial basis function %s\n', phi_name );

  nd = g00_size ( g );
  fprintf ( 1, '  Number of data points = %d\n', nd );

  [ xd, yd ] = g00_xy ( g, nd );
  
  zd = f00_f0 ( prob, nd, xd, yd );

  if ( phi_name == 'phi1' )
    r8vec3_print ( nd, xd, yd, zd, '  X, Y, Z data:' );
  end

  m = 2;
  xyd = [ xd'; yd' ];

  volume = prod ( max ( xyd, [], 2 ) - min ( xyd, [], 2 ) );
  r0 = ( volume / nd ) ^ ( 1 / m );

  fprintf ( 1, '  Setting R0 = %g\n', r0 );

  w = rbf_weight ( m, nd, xyd, r0, phi, zd );
%
%  #1:  Does interpolant match function at interpolation points?
%
  ni = nd;
  xyi = xyd;
  zi = rbf_interp ( m, nd, xyd, r0, phi, w, ni, xyi );

  int_error = norm ( zi - zd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 interpolation error averaged per interpolant node = %g\n', int_error );
%
%  #2: Plot the linear interpolant.
%
  if ( phi_name == 'phi1' )
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
%  #3: Plot the RBF interpolant.
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
  XYI = [ XI'; YI' ];
  ZI = rbf_interp ( m, nd, xyd, r0, phi, w, NI, XYI );
  XI = reshape ( XI, nix, niy );
  YI = reshape ( YI, nix, niy );
  ZI = reshape ( ZI, nix, niy );
  surf ( XI, YI, ZI );
  xlabel ( '<--- X --->' );
  ylabel ( '<--- Y --->' );
  zlabel ( '<---Z(X,Y)--->' );
  title ( sprintf ( 'RBF Interpolant using %s', phi_name ) )
  grid on
  hold off
  filename = sprintf ( 'p%02d_%s_poly.png', prob, phi_name );
  print ( '-dpng', filename );
  fprintf ( 1, '  Created plot file "%s".\n', filename );

  return
end
