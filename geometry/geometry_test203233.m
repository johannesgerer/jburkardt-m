function geometry_test203233 ( )

%*****************************************************************************80
%
%% TEST203233 tests TETRAHEDRON_QUALITY3_3D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2005
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
  fprintf ( 1, 'TEST203233\n' );
  fprintf ( 1, '  For a tetrahedron in 3D,\n' );
  fprintf ( 1, '  TETRAHEDRON_QUALITY3_3D computes quality measure #3;\n' );

  for test = 1 : test_num

    tetra(1:dim_num,1:4) = tetra_test(1:dim_num,1:4,test);

    r8mat_transpose_print ( dim_num, 4, tetra, '  Tetrahedron vertices:' );

    quality3 = tetrahedron_quality3_3d ( tetra );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Tetrahedron quality is %f\n', quality3 );

  end

  return
end
