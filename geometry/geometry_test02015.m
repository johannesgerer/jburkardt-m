function geometry_test02015 ( )

%*****************************************************************************80
%
%% TEST02015 tests CYLINDER_POINT_DIST_SIGNED_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  test_num = 6;

  dist_test = [ 3.0, -0.5, 5.0, 8.0, -1.0, -0.25 ];
  p_test = [ ...
      4.0,   0.5,  0.0; ...
     -0.5,  -1.0,  0.0; ...
      4.0,   6.0,  0.0; ...
      0.75, -10.0, 0.0; ...
      0.0,   0.0,  0.0; ...
      0.25,  1.75, 0.0 ]';
  p1 = [ 0.0, -2.0, 0.0 ];
  p2 = [ 0.0,  2.0, 0.0 ];
  r = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST02015\n' );
  fprintf ( 1, '  CYLINDER_POINT_DIST_SIGNED_3D computes the signed\n' );
  fprintf ( 1, '  distance to a cylinder.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Radius R = %f\n', r );
  fprintf ( 1, '  Center of bottom disk = %10f  %10f  %10f\n', p1(1:dim_num) );
  fprintf ( 1, '  Center of top disk =    %10f  %10f  %10f\n', p2(1:dim_num) );

  for test = 1 : test_num

    p(1:dim_num) = p_test(1:dim_num,test);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  P =    %10f  %10f  %10f\n', p(1:dim_num) );

    dist = cylinder_point_dist_signed_3d ( p1, p2, r, p );

    fprintf ( 1, '  Signed distance (computed) = %f\n', dist );
    fprintf ( 1, '  Signed distance (exact) =    %f\n', dist_test(test) );

  end

  return
end
