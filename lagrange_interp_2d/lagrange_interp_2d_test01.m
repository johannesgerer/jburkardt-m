function lagrange_interp_2d_test01 ( prob, m )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_2D_TEST01 tests LAGRANGE_INTERP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2012
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
  fprintf ( 1, 'LAGRANGE_INTERP_2D_TEST01:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_2D problem #%d.\n', prob );
  fprintf ( 1, '  Using polynomial interpolant of product degree %dx%d\n', mx, my );

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

  if ( nd <= 20 )
    r8vec3_print ( nd, xd, yd, zd, '  X, Y, Z data:' );
  end
%
%  #1:  Does interpolant match function at data points?
%
  ni = nd;
  xi = xd;
  yi = yd;
  zi = lagrange_interp_2d ( mx, my, xd_1d, yd_1d, zd, ni, xi, yi );

  if ( ni <= 20 )
    r8vec3_print ( ni, xi, yi, zi, '  X, Y, Z interpolation:' );
  end

  int_error = norm ( zi - zd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  RMS data interpolation error = %g\n', int_error );
%
%  #2:  Does interpolant approximate data at midpoints?
%
  if ( nd <= 1 )
    return
  end

  xi_1d = 0.5 * ( xd_1d(1:mx) + xd_1d(2:mx+1) );
  yi_1d = 0.5 * ( yd_1d(1:my) + yd_1d(2:my+1) );
  [ xi, yi ] = meshgrid ( xi_1d, yi_1d );
  ni = mx * my;

  xi = reshape ( xi, ni, 1 );
  yi = reshape ( yi, ni, 1 );
  zdm = f00_f0 ( prob, ni, xi, yi );
  xi = reshape ( xi, mx, my );
  yi = reshape ( yi, mx, my );

  zi = lagrange_interp_2d ( mx, my, xd_1d, yd_1d, zd, ni, xi, yi );

  app_error = norm ( zi - zdm ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  RMS data approximation error = %g\n', app_error );

  return
end
