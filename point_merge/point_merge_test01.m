function point_merge_test01 ( m, n, n_unique, seed )

%*****************************************************************************80
%
%% POINT_MERGE_TEST01 tests uniqueness counting with no tolerance. 
%
%  Discussion:
%
%    POINT_UNIQUE_COUNT uses an O(N) algorithm.
%    POINT_RADIAL_UNIQUE_COUNT uses an algorithm that should be,
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
  fprintf ( 1, 'POINT_MERGE_TEST01\n' );
  fprintf ( 1, '  To count the unique columns in an R8COL, we call\n' );
  fprintf ( 1, '  POINT_UNIQUE_COUNT,\n' );
  fprintf ( 1, '  POINT_RADIAL_UNIQUE_COUNT, (with random center)\n' );
  fprintf ( 1, '  POINT_TOL_UNIQUE_COUNT, (with zero tolerance)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  SEED = %d\n', seed );

  [ a, seed ] = r8col_duplicates ( m, n, n_unique, seed );

  r8mat_transpose_print ( m, n, a, '  Matrix with N_UNIQUE unique columns:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N_UNIQUE =                  %d\n', n_unique );

  unique_num = point_unique_count ( m, n, a );
  fprintf ( 1, '  POINT_UNIQUE_COUNT =        %d\n', unique_num );

  [ unique_num, seed ] = point_radial_unique_count ( m, n, a, seed );
  fprintf ( 1, '  POINT_RADIAL_UNIQUE_COUNT = %d\n', unique_num );

  tol = 0.0;
  unique_num = point_tol_unique_count ( m, n, a, tol );
  fprintf ( 1, '  POINT_TOL_UNIQUE_COUNT =    %d\n', unique_num );

  return
end
