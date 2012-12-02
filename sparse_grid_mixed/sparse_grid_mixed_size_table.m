function sparse_grid_mixed_size_table ( )

%****************************************************************************80
%
%% SPARSE_GRID_MIXED_SIZE_TABLE makes point count tables.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fabio Nobile, Raul Tempone, Clayton Webster,
%    A Sparse Grid Stochastic Collocation Method for Partial Differential
%    Equations with Random Input Data,
%    SIAM Journal on Numerical Analysis,
%    Volume 46, Number 5, 2008, pages 2309-2345.
%
  addpath ( '../sandia_rules' );

  fprintf ( 1, '\n' );
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_SIZE_TABLE makes point count tables.\n' );
  fprintf ( 1, '  MATLAB version\n' );
%
%  "Rule 0."
%  A special input that indicates we want a table of the number of polynomials
%  of degree DEGREE or less in space DIM.
%
  rule_1d = 0;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 7;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );

  rule_1d = 0;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 5;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );
%
%  Rule 1.
%  Clenshaw Curtis Expontial Growth.
%
  rule_1d = 1;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 7;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );

  rule_1d = 1;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 5;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );

  rule_1d = 1;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 100;
  dim_max = 100;
  level_max_min = 0;
  level_max_max = 2;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );
%
%  Rule 3.
%  Gauss Patterson Exponential Growth.
%
  rule_1d = 3;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 7;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );

  rule_1d = 3;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 5;
  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );
%
%  Rule 11.
%  Clenshaw-Curtis Slow Exponential Growth.
%
  rule_1d = 11;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );

  rule_1d = 11;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 5;
  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );
%
%  Rule 13.
%  Gauss Patterson Slow Exponential Growth.
%
  rule_1d = 13;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );

  rule_1d = 13;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 5;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );
%
%  Rule 16.
%  Gauss Patterson Moderate Exponential Growth.
%
  rule_1d = 16;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 5;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );

  rule_1d = 16;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 5;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );
%
%  Rule 17.
%
  rule_1d = 17;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 7;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );

  rule_1d = 17;
  alpha_1d = 0.0;
  beta_1d = 0.0;
  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 5;

  sparse_grid_mixed_size_tabulate ( rule_1d, alpha_1d, beta_1d, dim_min, ...
    dim_max, level_max_min, level_max_max );

  timestamp ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_MIXED_SIZE_TABLE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
