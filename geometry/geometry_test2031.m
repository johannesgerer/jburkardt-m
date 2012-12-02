function geometry_test2031 ( )

%*****************************************************************************80
%
%% TEST2031 tests TETRAHEDRON_CONTAINS_POINT_3D;
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
     0.000000,  0.942809, -0.333333; ...
    -0.816496, -0.816496, -0.333333; ...
     0.816496, -0.816496, -0.333333; ...
     0.000000,  0.000000,  1.000000 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2031\n' );
  fprintf ( 1, '  For a tetrahedron in 3D,\n' );
  fprintf ( 1, '  TETRAHEDRON_CONTAINS_POINT_3D finds if a point\n' );
  fprintf ( 1, '    is inside;\n' );

  r8mat_transpose_print ( dim_num, 4, tetra, '  Tetrahedron vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  P, Inside_Tetra?\n' );
  fprintf ( 1, '\n' );
%
%  Test 1
%
  c(1:4) = [ 0.0, 0.1, 0.2, 0.7 ];

  p(1:dim_num) = ( tetra(1:dim_num,1:4) * c(1:4)' )';

  inside = tetrahedron_contains_point_3d ( tetra, p );

  fprintf ( 1, '  %12f  %12f  %12f  %1d\n', p(1:dim_num), inside );
%
%  Test 2
%
  c(1:4) = [ -1.3, 2.0, 0.2, 0.1 ];

  p(1:dim_num) = ( tetra(1:dim_num,1:4) * c(1:4)' )';

  inside = tetrahedron_contains_point_3d ( tetra, p );

  fprintf ( 1, '  %12f  %12f  %12f  %1d\n', p(1:dim_num), inside );
%
%  Test 3
%
  c(1:4) = [ 0.8, 0.6, -0.5, 0.1 ];

  p(1:dim_num) = ( tetra(1:dim_num,1:4) * c(1:4)' )';

  inside = tetrahedron_contains_point_3d ( tetra, p );

  fprintf ( 1, '  %12f  %12f  %12f  %1d\n', p(1:dim_num), inside );

  return
end
