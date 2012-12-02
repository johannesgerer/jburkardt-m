function geometry_test209 ( )

%*****************************************************************************80
%
%% TEST209 tests TRIANGLE_AREA_3D, TRIANGLE_AREA_3D_2, TRIANGLE_AREA_3D_3;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  t = [ ...
    1.0,       2.0,       3.0; ...
    2.4142137, 3.4142137, 3.0; ...
    1.7071068, 2.7071068, 4.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST209\n' );
  fprintf ( 1, '  For a triangle in 3D:\n' );
  fprintf ( 1, '  TRIANGLE_AREA_3D   computes the area;\n' );
  fprintf ( 1, '  TRIANGLE_AREA_3D_2 computes the area;\n' );
  fprintf ( 1, '  TRIANGLE_AREA_3D_3 computes the area;\n' );

  r8mat_print ( dim_num, 3, t, '  Triangle (vertices are columns)' );

  area = triangle_area_3d ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Area #1 %f\n', area );

  area = triangle_area_3d_2 ( t );

  fprintf ( 1, '  Area #2 %f\n', area );

  area = triangle_area_3d_3 ( t );

  fprintf ( 1, '  Area #3 %f\n', area );

  return
end
