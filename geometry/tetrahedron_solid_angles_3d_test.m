function tetrahedron_solid_angles_3d_test ( )

%*****************************************************************************80
%
%% TETRAHEDRON_SOLID_ANGLES_3D_TEST tests TETRAHEDRON_SOLID_ANGLES_3D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 May 2015
%
%  Author:
%
%    John Burkardt
%
  t1 = [ ...
     0.000000,  0.942809, -0.333333; ...
    -0.816496, -0.816496, -0.333333; ...
     0.816496, -0.816496, -0.333333; ...
     0.000000,  0.000000,  1.000000 ]';
  t2 = [ ...
     0.000000,  0.000000,  0.000000; ...
     1.000000,  0.000000,  0.000000; ...
     0.000000,  1.000000,  0.000000; ...
     0.000000,  0.000000,  1.000000 ]';
  t3 = [ ...
     0.000000,  0.000000,  0.000000; ...
     1.000000,  0.000000,  0.000000; ...
     0.000000,  2.000000,  0.000000; ...
     0.000000,  0.000000,  4.000000 ]';
  t4 = [ ...
     0.000000,  0.000000,  0.000000; ...
     1.000000,  0.000000,  0.000000; ...
     0.000000,  1.000000,  0.000000; ...
     1.000000,  1.000000,  1.000000 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_SOLID_ANGLES_3D_TEST\n' );
  fprintf ( 1, '  TETRAHEDRON_SOLID_ANGLES_3D computes the solid angles\n' );
  fprintf ( 1, '  associated with the vertices of a tetrahedron in 3D.\n' );

  r8mat_transpose_print ( 3, 4, t1, '  Tetrahedron #1:' );
  angle = tetrahedron_solid_angles_3d ( t1 );
  r8vec_print ( 4, angle, '  Solid angles for tetrahedron #1:' );

  r8mat_transpose_print ( 3, 4, t2, '  Tetrahedron #2:' );
  angle = tetrahedron_solid_angles_3d ( t2 );
  r8vec_print ( 4, angle, '  Solid angles for tetrahedron #2:' );

  r8mat_transpose_print ( 3, 4, t3, '  Tetrahedron #3:' );
  angle = tetrahedron_solid_angles_3d ( t3 );
  r8vec_print ( 4, angle, '  Solid angles for tetrahedron #3:' );

  r8mat_transpose_print ( 3, 4, t4, '  Tetrahedron #4:' );
  angle = tetrahedron_solid_angles_3d ( t4 );
  r8vec_print ( 4, angle, '  Solid angles for tetrahedron #4:' );

  return
end
