function sparse_grid_mixed_index_tests ( )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_INDEX_TESTS calls SPARSE_GRID_MIXED_INDEX with various arguments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2011
%
%  Author:
%
%    John Burkardt
%
%  Local Parameters:
%
%    Local, real TOL, a tolerance for point equality.
%    A value of sqrt ( eps ) is reasonable, and will allow the code to
%    consolidate points which are equal, or very nearly so.  A value of
%    -1.0, on the other hand, will force the code to use every point, regardless
%    of duplication.
%
  addpath ( '../sandia_rules' );

  tol = sqrt ( eps );

  fprintf ( 1, '\n' );
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_INDEX_TESTS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Call SPARSE_GRID_MIXED_INDEX_TEST with various arguments.\n' );
  fprintf ( 1, '  All tests will use a point equality tolerance of %e\n', tol );

  dim_num = 2;
  level_max_min = 0;
  level_max_max = 2;
  rule = [ 1, 1 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );

  dim_num = 2;
  level_max_min = 0;
  level_max_max = 2;
  rule = [ 1, 3 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );

  dim_num = 2;
  level_max_min = 0;
  level_max_max = 2;
  rule = [ 1, 4 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );

  dim_num = 2;
  level_max_min = 0;
  level_max_max = 2;
  rule = [ 1, 7 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );

  dim_num = 2;
  level_max_min = 0;
  level_max_max = 2;
  rule = [ 1, 8 ]';
  alpha = [ 0.0, 1.5 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );

  dim_num = 2;
  level_max_min = 0;
  level_max_max = 2;
  rule = [ 2, 9 ]';
  alpha = [ 0.0, 0.5 ]';
  beta = [ 0.0, 1.5 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );

  dim_num = 2;
  level_max_min = 0;
  level_max_max = 2;
  rule = [ 6, 4 ]';
  alpha = [ 2.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );

  dim_num = 3;
  level_max_min = 0;
  level_max_max = 2;
  rule = [ 1, 2, 5 ]';
  alpha = [ 0.0, 0.0, 0.0 ]';
  beta = [ 0.0, 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );
%
%  Dimension 2, Level 3, Rule 13
%
  dim_num = 2;
  level_max_min = 3;
  level_max_max = 3;
  rule = [ 13, 13 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );
%
%  Dimension 2, Level 3, Rule 16
%
  dim_num = 2;
  level_max_min = 3;
  level_max_max = 3;
  rule = [ 16, 16 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );
%
%  Dimension 2, Level 4, Rule 17
%
  dim_num = 2;
  level_max_min = 4;
  level_max_max = 4;
  rule = [ 17, 17 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  sparse_grid_mixed_index_test ( dim_num, level_max_min, level_max_max, ...
    rule, alpha, beta, tol );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_INDEX_TESTS\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
