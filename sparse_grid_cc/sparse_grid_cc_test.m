function sparse_grid_cc_test ( )

%*****************************************************************************80
%
%% SPARSE_GRID_CC_TEST tests the SPARSE_GRID_CC library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 December 2009
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
  fprintf ( 1, 'SPARSE_GRID_CC_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SPARSE_GRID_CC library.\n' );
%
%  Count number of points in sparse rule from DIM_MIN to DIM_MAX, LEVEL_MAX_MAX.
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_cc_test01 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_cc_test01 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 100;
  dim_max = 100;
  level_max_min = 0;
  level_max_max = 3;
  sparse_grid_cc_test01 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );
%
%  Repeat for CCS grids.
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_cc_test015 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_grid_cc_test015 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );

  dim_min = 100;
  dim_max = 100;
  level_max_min = 0;
  level_max_max = 3;
  sparse_grid_cc_test015 ( dim_min, dim_max, level_max_min, level_max_max );

  fprintf ( 1, '\n' );
  timestamp ( );
%
%  Compute abstract grid indices of sparse grid points as selected from
%  product grid for DIMENSION, LEVEL_MAX.
%
  dim_num = 2;
  level_max = 3;
  sparse_grid_cc_test02 ( dim_num, level_max );

  dim_num = 2;
  level_max = 4;
  sparse_grid_cc_test02 ( dim_num, level_max );

  dim_num = 3;
  level_max = 0;
  sparse_grid_cc_test02 ( dim_num, level_max );

  dim_num = 3;
  level_max = 2;
  sparse_grid_cc_test02 ( dim_num, level_max );

  dim_num = 6;
  level_max = 2;
  sparse_grid_cc_test02 ( dim_num, level_max );
%
%  Compute sparse Clenshaw-Curtis rule for DIMENSION, LEVEL_MAX.
%
  dim_num = 2;
  level_max = 3;
  sparse_grid_cc_test03 ( dim_num, level_max );

  dim_num = 3;
  level_max = 0;
  sparse_grid_cc_test03 ( dim_num, level_max );

  dim_num = 3;
  level_max = 1;
  sparse_grid_cc_test03 ( dim_num, level_max );
%
%  Test sum of weights for DIMENSION, LEVEL_MAX.
%
  sparse_grid_cc_test04 ( 2, 4 );
  sparse_grid_cc_test04 ( 3, 0 );
  sparse_grid_cc_test04 ( 3, 1 );
  sparse_grid_cc_test04 ( 3, 6 );
  sparse_grid_cc_test04 ( 10, 3 );
%
%  Test monomial exactness for DIMENSION, LEVEL_MAX, DEGREE_MAX.
%
  sparse_grid_cc_test05 ( 2, 0, 3 );
  sparse_grid_cc_test05 ( 2, 1, 5 );
  sparse_grid_cc_test05 ( 2, 2, 7 );
  sparse_grid_cc_test05 ( 2, 3, 9 );
  sparse_grid_cc_test05 ( 2, 4, 11 );
  sparse_grid_cc_test05 ( 2, 5, 13 );

  sparse_grid_cc_test05 ( 3, 0, 2 );
  sparse_grid_cc_test05 ( 3, 1, 4 );
  sparse_grid_cc_test05 ( 3, 2, 6 );
  sparse_grid_cc_test05 ( 3, 3, 8 );
%
%  Show how to write a rule to a file.
%
  dim_num = 2;
  level_max = 3;
  sparse_grid_cc_test06 ( dim_num, level_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_CC_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

