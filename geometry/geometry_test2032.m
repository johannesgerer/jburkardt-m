function geometry_test2032 ( )

%*****************************************************************************80
%
%% TEST2032 tests TETRAHEDRON_CIRCUMSPHERE_3D;
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

  tetra = [ ...
     0.577350269189626,  0.0, 0.0; ...
    -0.288675134594813,  0.5, 0.0; ...
    -0.288675134594813, -0.5, 0.0; ...
     0.0,                0.0, 0.816496580927726 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2032\n' );
  fprintf ( 1, '  For a tetrahedron in 3D,\n' );
  fprintf ( 1, '  TETRAHEDRON_CIRCUMSPHERE_3D computes the circumsphere;\n' );

  r8mat_transpose_print ( dim_num, 4, tetra, '  Tetrahedron vertices:' );

  [ r, center ] = tetrahedron_circumsphere_3d ( tetra  );

  r8vec_print ( dim_num, center, '  Circumsphere center:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Circumsphere radius is %f\n', r );
 
  return
end
