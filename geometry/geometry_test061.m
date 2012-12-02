function geometry_test061 ( )

%*****************************************************************************80
%
%% TEST061 tests PLANE_NORMAL_BASIS_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  test_num = 5;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST061\n' );
  fprintf ( 1, '  PLANE_NORMAL_BASIS_3D, given a plane in\n' );
  fprintf ( 1, '    point, normal form (P,N), finds two unit\n' );
  fprintf ( 1, '    vectors Q and R that "lie" in the plane\n' );
  fprintf ( 1, '    and are mutually orthogonal.\n' );

  for test = 1 : test_num

    [ pp(1:3,1), seed ] = r8vec_uniform_01 ( 3, seed );

    [ normal(1:3,1), seed ] = r8vec_uniform_01 ( 3, seed );
    t = norm ( normal );
    normal = normal / t;

    [ pq, pr ] = plane_normal_basis_3d ( pp, normal );

    if ( test == 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Data for test 1:\n' );
      fprintf ( 1, '\n' );
      r8vec_print ( 3, pp, '  Point PP:' );
      r8vec_print ( 3, normal, '  Normal vector N:' );
      r8vec_print ( 3, pq, '  Vector PQ:' );
      r8vec_print ( 3, pr, '  Vector PR:' );
    end

    b(1,1) = normal(1:3,1)' * normal(1:3,1);
    b(1,2) = normal(1:3,1)' * pq(1:3,1);
    b(1,3) = normal(1:3,1)' * pr(1:3,1);

    b(2,1) = pq(1:3,1)' * normal(1:3,1);
    b(2,2) = pq(1:3,1)' * pq(1:3,1);
    b(2,3) = pq(1:3,1)' * pr(1:3,1);

    b(3,1) = pr(1:3,1)' * normal(1:3,1);
    b(3,2) = pr(1:3,1)' * pq(1:3,1);
    b(3,3) = pr(1:3,1)' * pr(1:3,1);

    r8mat_print ( 3, 3, b, '  Dot product matrix:' );

  end

  return
end
