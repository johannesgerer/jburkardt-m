
function point_merge_test05 ( m, n, n_unique, tol, seed )

%*****************************************************************************80
%
%% POINT_MERGE_TEST05 times uniqueness indexing with a tolerance. 
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
%    28 July 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POINT_MERGE_TEST05\n' );
  fprintf ( 1, '  We time the computations in TEST04, calling\n' );
  fprintf ( 1, '  POINT_RADIAL_TOL_UNIQUE_COUNT, (with random center)\n' );
  fprintf ( 1, '  POINT_TOL_UNIQUE_COUNT, (with zero tolerance)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  M = %d\n', m );
  fprintf ( 1, '  N = %d\n', n );
  fprintf ( 1, '  TOL = %f\n', tol );
  fprintf ( 1, '  SEED = %d\n', seed );

  [ a, seed ] = r8col_duplicates ( m, n, n_unique, seed );
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

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N_UNIQUE =                      %d\n', n_unique );

  tic;
  [ unique_num, undx, xdnu, seed ] = point_radial_tol_unique_index ( m, n, a, ...
    tol, seed );
  wtime = toc;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  POINT_RADIAL_TOL_UNIQUE_INDEX\n' );
  fprintf ( 1, '  Unique_num = %d\n', unique_num );
  fprintf ( 1, '  Time = %f\n', wtime );

  tic;
  [ unique_num, xdnu ] = point_tol_unique_index ( m, n, a, tol );
  wtime = toc;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  POINT_TOL_UNIQUE_INDEX\n' );
  fprintf ( 1, '  Unique_num = %d\n', unique_num );
  fprintf ( 1, '  Time = %f\n', wtime );

  return
end
