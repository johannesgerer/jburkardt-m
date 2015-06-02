function geometry_test0351 ( )

%*****************************************************************************80
%
%% GEOMETRY_TEST0351 tests LINE_PAR_POINT_NEAR_2D and LINE_PAR_POINT_DIST_2D.
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
    0.0,  0.0; ...
    5.0, -1.0; ...
    5.0,  3.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEOMETRY_TEST0351\n' );
  fprintf ( 1, '  LINE_PAR_POINT_NEAR_2D finds the point on\n' );
  fprintf ( 1, '  a parametric line (X0,Y0,F,G) nearest a point P in 2D.\n' );

  x0 = 1.0;
  y0 = 3.0;
  f = +1.0;
  g = -1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Parametric line:\n' );
  fprintf ( 1, '  X(t) = %g + %g * t\n', x0, f );
  fprintf ( 1, '  Y(t) = %g + %g * t\n', y0, g );

  for test = 1 : test_num

    p(1:2,1) = p_test(1:2,test);

    r8vec_print ( 2, p, '  The point P:' );

    dist = line_par_point_dist_2d ( f, g, x0, y0, p );

    fprintf ( 1, '  Distance = %g\n', dist );

    pn = line_par_point_near_2d ( f, g, x0, y0, p );

    r8vec_print ( 2, pn, '  Nearest point PN:' );

    dist = r8vec_norm_affine ( 2, p, pn );

    fprintf ( 1, '  Distance recomputed = %g\n', dist );

  end

  return
end
