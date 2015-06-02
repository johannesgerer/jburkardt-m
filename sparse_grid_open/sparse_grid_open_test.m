function sparse_grid_open_test ( )

%*****************************************************************************80
%
%% SPARSE_GRID_OPEN_TEST tests the SPARSE_GRID_OPEN library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 January 2010
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
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_OPEN_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPARSE_GRID_OPEN library.\n' );
%
%  Point counts for Open Fully Nested "OFN" rules.
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test01 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test01 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );
%
%  Point counts for Open Non Nested "ONN" rules.
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test011 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test011 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );
%
%  Point counts for Open Weakly Nested "OWN" rules.
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test012 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test012 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );
%
%  Point counts for Fejer Type 2 Slow rules.
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test013 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test013 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );
%
%  Point counts for Gauss Patterson Slow rules.
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test015 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_open_test015 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  sparse_grid_open_test02 ( 2, 3 );
  sparse_grid_open_test02 ( 2, 4 );
  sparse_grid_open_test02 ( 3, 2 );
  sparse_grid_open_test02 ( 6, 2 );

  sparse_grid_open_test04 ( 2, 3 );

  sparse_grid_open_test05 ( 2, 3 );

  sparse_grid_open_test06 ( 2, 4 );

  sparse_grid_open_test08 ( 2, 3 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_OPEN_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
