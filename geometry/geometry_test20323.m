function geometry_test20323 ( )

%*****************************************************************************80
%
%% TEST20323 tests TETRAHEDRON_QUALITY1_3D;
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
  test_num = 2;

  tetra_test = reshape ( [ ...
     0.577350269189626,  0.0, 0.0, ...
    -0.288675134594813,  0.5, 0.0, ...
    -0.288675134594813, -0.5, 0.816496580927726, ...
     0.0,                0.0, 0.816496580927726, ...
     0.577350269189626,  0.0, 0.0, ...
    -0.288675134594813,  0.5, 0.0, ...
    -0.288675134594813, -0.5, 0.0, ...
     0.0,                0.0, 0.408248290463863 ], ...
    dim_num, 4, test_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST20323\n' );
  fprintf ( 1, '  For a tetrahedron in 3D,\n' );
  fprintf ( 1, '  TETRAHEDRON_QUALITY1_3D computes quality measure #1;\n' );

  for test = 1 : test_num

    tetra(1:dim_num,1:4) = tetra_test(1:dim_num,1:4,test);

    r8mat_transpose_print ( dim_num, 4, tetra, '  Tetrahedron vertices:' );

    quality = tetrahedron_quality1_3d ( tetra );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Tetrahedron quality is %f\n', quality );

  end

  return
end
