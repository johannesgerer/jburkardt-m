function sparse_grid_hermite_test ( )

%*****************************************************************************80
%
%% SPARSE_GRID_HERMITE_TEST tests the SPARSE_GRID_HERMITE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    26 December 2009
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
  fprintf ( 1, 'SPARSE_GRID_HERMITE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SPARSE_GRID_HERMITE library.\n' );
%
%  Count number of points in sparse rule from DIM_MIN to DIM_MAX, LEVEL_MAX_MAX.
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;

  sparse_grid_hermite_test01 ( dim_min, dim_max, level_max_min, level_max_max );
  
  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;

  sparse_grid_hermite_test01 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 100;
  dim_max = 100;
  level_max_min = 0;
  level_max_max = 2;

  sparse_grid_hermite_test01 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  Compute abstract grid indices of sparse grid points as selected from product grid
%  for DIMENSION, LEVEL_MAX.
%
  dim_num = 2;
  level_max = 3;
  sparse_grid_hermite_test02 ( dim_num, level_max );

  dim_num = 2;
  level_max = 4;
  sparse_grid_hermite_test02 ( dim_num, level_max );

  dim_num = 3;
  level_max = 0;
  sparse_grid_hermite_test02 ( dim_num, level_max );

  dim_num = 3;
  level_max = 2;
  sparse_grid_hermite_test02 ( dim_num, level_max );

  dim_num = 6;
  level_max = 2;
  sparse_grid_hermite_test02 ( dim_num, level_max );
%
%  Compute sparse Gauss-Legendre rule for DIMENSION, LEVEL_MAX.
%
  dim_num = 2;
  level_max = 0;
  sparse_grid_hermite_test03 ( dim_num, level_max );

  dim_num = 2;
  level_max = 3;
  sparse_grid_hermite_test03 ( dim_num, level_max );

  dim_num = 2;
  level_max = 4;
  sparse_grid_hermite_test03 ( dim_num, level_max );

  dim_num = 3;
  level_max = 0;
  sparse_grid_hermite_test03 ( dim_num, level_max );

  dim_num = 3;
  level_max = 2;
  sparse_grid_hermite_test03 ( dim_num, level_max );
%
%  Test sum of weights for DIMENSION, LEVEL_MAX.
%
  dim_num = 2;
  level_max = 4;
  sparse_grid_hermite_test04 ( dim_num, level_max );

  dim_num = 3;
  level_max = 0;
  sparse_grid_hermite_test04 ( dim_num, level_max );

  dim_num = 3;
  level_max = 1;
  sparse_grid_hermite_test04 ( dim_num, level_max );
  
  dim_num = 3;
  level_max = 6;
  sparse_grid_hermite_test04 ( dim_num, level_max );

  dim_num = 10;
  level_max = 3;
  sparse_grid_hermite_test04 ( dim_num, level_max );
%
%  Test monomial exactness for DIMENSION, LEVEL_MAX, DEGREE_MAX.
% 
  dim_num = 2;
  level_max = 0;
  degree_max = 3;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 2;
  level_max = 1;
  degree_max = 5;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 2;
  level_max = 2;
  degree_max = 7;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 2;
  level_max = 3;
  degree_max = 9;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 2;
  level_max = 4;
  degree_max = 11;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 2;
  level_max = 5;
  degree_max = 13;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 3;
  level_max = 0;
  degree_max = 2;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 3;
  level_max = 1;
  degree_max = 4;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 3;
  level_max = 2;
  degree_max = 6;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );

  dim_num = 3;
  level_max = 3;
  degree_max = 8;
  sparse_grid_hermite_test05 ( dim_num, level_max, degree_max );
%
%  Show how to write a rule to a file.
%
  dim_num = 2;
  level_max = 3;

  sparse_grid_hermite_test06 ( dim_num, level_max );
%
%  All done.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_HERMITE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
