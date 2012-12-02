function point_merge_test02 ( m, n, n_unique, tol, seed )

%*****************************************************************************80
%
%% POINT_MERGE_TEST02 tests uniqueness counting with a tolerance. 
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
  fprintf ( 1, 'POINT_MERGE_TEST02\n' );
  fprintf ( 1, '  To count the unique columns in an R8COL, we call\n' );
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

  [ unique_num, seed ] = point_radial_tol_unique_count ( m, n, a, tol, seed );
  fprintf ( 1, '  POINT_RADIAL_TOL_UNIQUE_COUNT = %d\n', unique_num );

  unique_num = point_tol_unique_count ( m, n, a, tol );
  fprintf ( 1, '  POINT_TOL_UNIQUE_COUNT =        %d\n', unique_num );

  return
end
