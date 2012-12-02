function tet_mesh_test005 ( )

%*****************************************************************************80
%
%% TET_MESH_TEST005 tests TETRAHEDRON_BARYCENTRIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2009
%
%  Author:
%
%    John Burkardt
%
  test1_num = 3;
  test2_num = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST005\n' );
  fprintf ( 1, '  TETRAHEDRON_BARYCENTRIC computes the barycentric\n' );
  fprintf ( 1, '  coordinates of a point.\n' );
%
%  Choose a random tetrahedron.
%
  for test1 = 1 : test1_num

    [ tet_xyz, seed ] = r8mat_uniform_01 ( 3, 4, seed );

    r8mat_transpose_print ( 3, 4, tet_xyz, '  Random tetrahedron:' );
%
%  Choose barycentric coordinates C1 at random.
%
%  Define a point P.
%
%  Have TETRAHEDRON_BARYCENTRIC compute C2, the barycentric coordinates of P.
%
    for test2 = 1 : test2_num

      [ c1, seed ] = r8vec_uniform_01 ( 4, seed );
      c1_sum = sum ( c1(1:4) );
      c1(1:4) = c1(1:4) / c1_sum;

      p(1:3) = tet_xyz(1:3,1:4) * c1(1:4)';

      c2 = tetrahedron_barycentric ( tet_xyz, p );

      fprintf ( 1, '\n' );
      fprintf ( 1, '  C1 =  %14.6f  %14.6f  %14.6f  %14.6f\n', c1 );
      fprintf ( 1, '  C2 =  %14.6f  %14.6f  %14.6f  %14.6f\n', c2 );

    end
  end

  return
end
