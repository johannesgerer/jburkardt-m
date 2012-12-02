function point_merge_test04 ( m, n, n_unique, tol, seed )

%*****************************************************************************80
%
%% POINT_MERGE_TEST04 tests uniqueness indexing with a tolerance. 
%
%  Discussion:
%
%    POINT_RADIAL_TOL_UNIQUE_COUNT uses an algorithm that should be,
%      in general, O(N);
%    POINT_TOL_UNIQUE_COUNT uses an O(N^2) algorithm.
%
%    For this test, we just want to make sure the algorithms agree
%    in the counting.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 July 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POINT_MERGE_TEST04\n' );
  fprintf ( 1, '  To index the unique columns in an R8COL, we call\n' );
  fprintf ( 1, '  POINT_RADIAL_TOL_UNIQUE_COUNT, (with random center)\n' );
  fprintf ( 1, '  POINT_TOL_UNIQUE_COUNT, (with zero tolerance)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  TOL = %f\n', tol );
  fprintf ( 1, '  SEED = %d\n', seed );

  [ a, seed ] = r8col_duplicates ( m, n, n_unique, seed );

  r8mat_transpose_print ( m, n, a, '  Matrix with N_UNIQUE unique columns:' );
%
%  The form of the tolerance test means that if two vectors are initially
%  equal, they remain "tolerably equal" after the addition of random
%  perturbation vectors whose 2-norm is no greater than TOL/2.
%
  for j = 1 : n
    [ r, seed ] = r8vec_uniform_01 ( m, seed );
    r(1:m) = r(1:m) / sqrt ( sum ( r(1:m).^2 ) );
    a(1:m,j) = a(1:m,j) + 0.5 * tol * r(1:m,1);
  end

  r8mat_transpose_print ( m, n, a, '  Blurred matrix:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N_UNIQUE =                      %d\n', n_unique );

  [ unique_num, undx, xdnu, seed ] = point_radial_tol_unique_index ( m, n, a, ...
    tol, seed );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  POINT_RADIAL_TOL_UNIQUE_INDEX\n' );
  fprintf ( 1, '  Unique_num = %d\n', unique_num );

  i4vec_print ( unique_num, undx, '  UNDX:' );

  i4vec_print ( n, xdnu, '  XDNU:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  List of nonunique points P(J), represented by\n' );
  fprintf ( 1, '  point with index I(J).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  J, P(J)\n' );
  fprintf ( 1, '  I(J), P(I(J))\n' );
  fprintf ( 1, '  || P(J) - P(I(J)) || (should be <= TOL)\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    k = undx(xdnu(j));
    if ( j ~= k )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  %4d', j );
      for i = 1 : m
        fprintf ( 1, '  %14f', a(i,j) );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '  %4d', k );
      for i = 1 : m
        fprintf ( 1, '  %14f', a(i,k) );
      end
      fprintf ( 1, '\n' );
      dist = sqrt ( sum ( ( a(1:m,j) - a(1:m,k) ).^2 ) );
      fprintf ( 1, '          %10f\n', dist );
    end
  end
%
%  The interpretation of XDNU is simpler for POINT_TOL_UNIQUE_INDEX.
%
  [ unique_num, xdnu ] = point_tol_unique_index ( m, n, a, tol );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  POINT_TOL_UNIQUE_INDEX\n' );
  fprintf ( 1, '  Unique_num = %d\n', unique_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  List of nonunique points P(J), represented by\n' );
  fprintf ( 1, '  point with index I(J).\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  J, P(J)\n' );
  fprintf ( 1, '  I(J), P(I(J))\n' );
  fprintf ( 1, '  || P(J) - P(I(J)) || (should be <= TOL)\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    k = xdnu(j);
    if ( j ~= k )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  %4d', j );
      for i = 1 : m
        fprintf ( 1, '  %14f', a(i,j) );
      end
      fprintf ( 1, '\n' );
      fprintf ( 1, '  %4d', k );
      for i = 1 : m
        fprintf ( 1, '  %14f', a(i,k) );
      end
      fprintf ( 1, '\n' );
      dist = sqrt ( sum ( ( a(1:m,j) - a(1:m,k) ).^2 ) );
      fprintf ( 1, '          %10f\n', dist );
    end
  end

  return
end
