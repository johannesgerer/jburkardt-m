function sparse_grid_mixed_write_test ( dim_num, level_max, rule, alpha, ...
  beta, tol, file_name )

%*****************************************************************************80
%
%% SPARSE_GRID_MIXED_WRITE_TEST tests SPARSE_GRID_MIXED_WRITE.
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
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer LEVEL_MAX, the level that defines the grid.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested rule.
%     2, "F2",  Fejer Type 2, Open Fully Nested rule.
%     3, "GP",  Gauss Patterson, Open Fully Nested rule.
%     4, "GL",  Gauss Legendre, Open Weakly Nested rule.
%     5, "GH",  Gauss Hermite, Open Weakly Nested rule.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested rule.
%     7, "LG",  Gauss Laguerre, Open Non Nested rule.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested rule.
%     9, "GJ",  Gauss Jacobi, Open Non Nested rule.
%    10, "GW",  Golub Welsch, (presumed) Open Non Nested rule.
%    11, "CC_SE", Clenshaw Curtis Slow Exponential, Closed Fully Nested rule.
%    12, "F2_SE", Fejer Type 2 Slow Exponential, Closed Fully Nested rule.
%    13, "GP_SE", Gauss Patterson Slow Exponential, Closed Fully Nested rule.
%    14, "CC_ME", Clenshaw Curtis Moderate Exponential, Closed Fully Nested rule.
%    15, "F2_ME", Fejer Type 2 Moderate Exponential, Closed Fully Nested rule.
%    16, "GP_ME", Gauss Patterson Moderate Exponential, Closed Fully Nested rule.
%    17, "CCN", Clenshaw Curtis Nested, Linear, Closed Fully Nested rule.
%
%    Input, real ALPHA(DIM_NUM), BETA(DIM_NUM), parameters used for
%    Generalized Gauss Hermite, Generalized Gauss Laguerre, and Gauss Jacobi rules.
%
%    Input, real TOL, the tolerance for point equality.
%
%    Input, string FILE_NAME, the main name of the output files.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_WRITE_TEST\n' );
  fprintf ( 1, '  SPARSE_GRID_MIXED_WRITE writes a sparse grid rule\n' );
  fprintf ( 1, '  to A, B, R, W and X files.\n' );
%
%  Compute necessary data.
%
  point_total_num = sparse_grid_mixed_size_total ( dim_num, level_max, rule );

  point_num = sparse_grid_mixed_size ( dim_num, level_max, rule, alpha, beta, tol );

  sparse_unique_index = sparse_grid_mixed_unique_index ( ...
    dim_num, level_max, rule, alpha, beta, tol, point_num, point_total_num );

  [ sparse_order, sparse_index ] = sparse_grid_mixed_index ( ...
    dim_num, level_max, rule, point_num, point_total_num, sparse_unique_index );
%
%  Compute points and weights.
%
  sparse_point = sparse_grid_mixed_point ( dim_num, level_max, rule, ...
    alpha, beta, point_num, sparse_order, sparse_index );

  sparse_weight = sparse_grid_mixed_weight ( dim_num, level_max, rule, ...
    alpha, beta, point_num, point_total_num, sparse_unique_index );
%
%  Write points and weights to files.
%
  sparse_grid_mixed_write ( dim_num, rule, alpha, beta, point_num, ...
    sparse_weight, sparse_point, file_name );

  return
end
