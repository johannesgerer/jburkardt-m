function geometry_test0352 ( )

%*****************************************************************************80
%
%% GEOMETRY_TEST0352 tests LINE_PAR_POINT_DIST_3D and LINE_PAR_POINT_NEAR_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 April 2013
%
%  Author:
%
%    John Burkardt
%
  test_num = 3;

  p_test = [ ...
    0.0,  0.0, 2.0; ...
    5.0, -1.0, 1.0; ...
    5.0,  3.0, 3.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMETRY_TEST0352\n' );
  fprintf ( 1, '  LINE_PAR_POINT_DIST_3D finds the distance.\n' );
  fprintf ( 1, '  from a parametric line to a point in 3D.\n' );

  x0 = 1.0;
  y0 = 3.0;
  z0 = 2.0;

  f = +3.0;
  g = -3.0;
  h = -1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Parametric line:\n' );
  fprintf ( 1, '  X(t) = %g + %g * t\n', x0, g );
  fprintf ( 1, '  Y(t) = %g + %g * t\n', y0, g );
  fprintf ( 1, '  Z(t) = %g + %g * t\n', z0, h );

  for test = 1 : test_num

    p(1:3,1) = p_test(1:3,test);

    r8vec_print ( 3, p, '  The point P:' );

    dist = line_par_point_dist_3d ( f, g, h, x0, y0, z0, p );

    fprintf ( 1, '  Distance = %g\n', dist );

    pn = line_par_point_near_3d ( f, g, h, x0, y0, z0, p );

    r8vec_print ( 3, pn, '  Nearest point PN:' );

    dist = r8vec_norm_affine ( 3, p, pn );

    fprintf ( 1, '  Distance recomputed = %g\n', dist );

  end

  return
end
