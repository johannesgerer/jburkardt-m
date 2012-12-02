function geometry_test20232 ( )

%*****************************************************************************80
%
%% TEST20322 tests TETRAHEDRON_INSPHERE_3D;
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
  fprintf ( 1, 'TEST20322\n' );
  fprintf ( 1, '  For a tetrahedron in 3D,\n' );
  fprintf ( 1, '  TETRAHEDRON_INSPHERE_3D computes the insphere;\n' );

  r8mat_transpose_print ( dim_num, 4, tetra, '  Tetrahedron vertices:' );

  [ r, pc ] = tetrahedron_insphere_3d ( tetra );

  r8vec_print ( dim_num, pc, '  Insphere center:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Insphere radius is %f\n', r );

  return
end
