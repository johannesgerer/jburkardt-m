function geometry_test0825 ()

%*****************************************************************************80
%
%% TEST0825 tests POLYHEDRON_CONTAINS_POINT_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  face_num = 4;
  face_order_max = 3;
  node_num = 4;
  test_num = 100;

  face_order = [ 3, 3, 3, 3 ];
  face_point = [ ...
    1, 2, 4; ...
    1, 3, 2; ...
    1, 4, 3; ...
    2, 3, 4 ]';
  v = [ ...
    0.0, 0.0, 0.0; ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0825\n' );
  fprintf ( 1, '  POLYHEDRON_CONTAINS_POINT_3D determines if a point\n' );
  fprintf ( 1, '  is inside a polyhedron.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We test this routine by using a tetrahedron as\n' );
  fprintf ( 1, '  the polyhedron.\n' );
  fprintf ( 1, '  For this shape, an independent check can be made,\n' );
  fprintf ( 1, '  using barycentric coordinates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We label these checks IN1 and IN2, and\n' );
  fprintf ( 1, '  we expect them to agree.\n' );

  r8mat_transpose_print ( dim_num, node_num, v, '  The vertices:' );

  i4vec_print ( face_num, face_order, '  The face orders:' );

  i4mat_transpose_print ( face_order_max, face_num, face_point, ...
    '  The nodes making each face:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '      X           Y           Z      IN1 IN2\n' );
  fprintf ( 1, '\n' );

  seed = 123456789;

  for test = 1 : test_num

    [ p, seed ] = r8vec_uniform_01 ( dim_num, seed );

    inside1 = polyhedron_contains_point_3d ( node_num, face_num, ...
      face_order_max, v, face_order, face_point, p );

    c = tetrahedron_barycentric_3d ( v, p );

    inside2 =  ( 0.0 <= c(1) ) & ( c(1) <= 1.0 ) & ...
               ( 0.0 <= c(2) ) & ( c(2) <= 1.0 ) & ...
               ( 0.0 <= c(3) ) & ( c(3) <= 1.0 ) & ...
               ( 0.0 <= c(4) ) & ( c(4) <= 1.0 ) & ...
               ( c(1) + c(2) + c(3) + c(4) <= 1.0 );

    fprintf ( 1, '  %14f  %14f  %14f  %1d  %1d\n', p(1:3), inside1, inside2 );

    if ( inside1 ~= inside2 )
      fprintf ( 1, '??? Disagreement!  Barycentric coordinates:\n' );
      fprintf ( 1, '  %14f  %14f  %14f  %14f\n', c(1:4) );
    end

  end 

  return
end
