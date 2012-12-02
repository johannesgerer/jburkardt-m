function sgmga_write_test ( dim_num, level_weight, level_max, rule, ...
  growth, np, p, tol, file_name )

%****************************************************************************80
%
%% SGMGA_WRITE_TEST tests SGMGA_WRITE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, real LEVEL_WEIGHT(DIM_NUM), the anisotropic weight
%    for each dimension.
%
%    Input, integer LEVEL_MAX, the level that defines the grid.
%
%    Input, integer RULE(DIM_NUM), the rule in each dimension.
%     1, "CC",  Clenshaw Curtis, Closed Fully Nested.
%     2, "F2",  Fejer Type 2, Open Fully Nested.
%     3, "GP",  Gauss Patterson, Open Fully Nested.
%     4, "GL",  Gauss Legendre, Open Weakly Nested.
%     5, "GH",  Gauss Hermite, Open Weakly Nested.
%     6, "GGH", Generalized Gauss Hermite, Open Weakly Nested.
%     7, "LG",  Gauss Laguerre, Open Non Nested.
%     8, "GLG", Generalized Gauss Laguerre, Open Non Nested.
%     9, "GJ",  Gauss Jacobi, Open Non Nested.
%    10, "HGK", Hermite Genz-Keister, Open Fully Nested.
%    11, "UO",  User supplied Open, presumably Non Nested.
%    12, "UC",  User supplied Closed, presumably Non Nested.
%
%    Input, integer GROWTH(DIM_NUM), the growth in each dimension.
%    0, "DF", default growth associated with this quadrature rule;
%    1, "SL", slow linear, L+1;
%    2  "SO", slow linear odd, O=1+2((L+1)/2)
%    3, "ML", moderate linear, 2L+1;
%    4, "SE", slow exponential;
%    5, "ME", moderate exponential;
%    6, "FE", full exponential.
%
%    Input, integer NP(DIM_NUM), the number of parameters used by each rule.
%
%    Input, real P(*), the parameters needed by each rule.
%
%    Input, real TOL, a tolerance for point equality.
%
%    Input, string FILE_NAME, the main name of the
%    output files.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_WRITE_TEST\n' );
  fprintf ( 1, '  SGMGA_WRITE writes a sparse grid rule to files.\n' );
%
%  Compute necessary data.
%
  point_total_num = sgmga_size_total ( dim_num, level_weight, level_max, ...
    rule, growth );

  point_num = sgmga_size ( dim_num, level_weight, level_max, rule, growth, ...
    np, p, tol );

  sparse_unique_index = sgmga_unique_index ( dim_num, level_weight, ...
    level_max, rule, growth, np, p, tol, point_num, point_total_num );

  [ sparse_order, sparse_index ] = sgmga_index ( dim_num, level_weight, ...
    level_max, rule, growth, point_num, point_total_num, sparse_unique_index );
%
%  Compute points and weights.
%
  sparse_point = sgmga_point ( dim_num, level_weight, level_max, ...
    rule, growth, np, p, point_num, sparse_order, sparse_index );

  sparse_weight = sgmga_weight ( dim_num, level_weight, level_max, ...
    rule, growth, np, p, point_num, point_total_num, sparse_unique_index );
%
%  Write points and weights to files.
%
  sgmga_write ( dim_num, level_weight, rule, growth, np, p, ...
    point_num, sparse_weight, sparse_point, file_name );

  return
end
