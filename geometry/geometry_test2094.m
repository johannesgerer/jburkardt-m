function geometry_test2094 ( )

%*****************************************************************************80
%
%% TEST2094 tests TRIANGLE_CENTROID_3D;
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

  t = [ ...
    1.0,       2.0,       3.0; ...
    2.4142137, 3.4142137, 3.0; ...
    1.7071068, 2.7071068, 4.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2094\n' );
  fprintf ( 1, '  For a triangle in 3D:\n' );
  fprintf ( 1, '  TRIANGLE_CENTROID_3D computes the centroid.\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  centroid = triangle_centroid_3d ( t );

  r8vec_print ( dim_num, centroid, '  Centroid:' );

  return
end
