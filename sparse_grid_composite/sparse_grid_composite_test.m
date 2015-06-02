function sparse_grid_composite_test ( )

%*****************************************************************************80
%
%% SPARSE_GRID_COMPOSITE_TEST tests the SPARSE_GRID_COMPOSITE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 August 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_COMPOSITE_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the SPARSE_GRID_COMPOSITE library.\n' );
% 
%  Count number of points in sparse rule from DIM_MIN to DIM_MAX, LEVEL_MAX_MAX. 
%
  sparse_grid_composite_test01 ( 1, 6, 0, 5 );
  sparse_grid_composite_test01 ( 6, 10, 0, 4 ); 
  sparse_grid_composite_test01 ( 100, 100, 0, 1 ); 
% 
%  Compute abstract grid indices of sparse grid points as selected from 
%  product grid for DIMENSION, LEVEL_MAX. 
%
  dim_num = 2;
  level_max = 3;
  sparse_grid_composite_test02 ( dim_num, level_max ); 
  
  dim_num = 2;
  level_max = 4;
  sparse_grid_composite_test02 ( dim_num, level_max ); 
  
  dim_num = 3;
  level_max = 0;
  sparse_grid_composite_test02 ( dim_num, level_max ); 
  
  dim_num = 3;
  level_max = 2;
  sparse_grid_composite_test02 ( dim_num, level_max ); 
  
  dim_num = 6;
  level_max = 2;
  sparse_grid_composite_test02 ( dim_num, level_max ); 
%
%  Compute sparse composite rule for DIMENSION, LEVEL_MAX. 
%
  dim_num = 2;
  level_max = 3;
  sparse_grid_composite_test03 ( dim_num, level_max ); 
  
  dim_num = 3;
  level_max = 0;
  sparse_grid_composite_test03 ( dim_num, level_max ); 
  
  dim_num = 3;
  level_max = 1;
  sparse_grid_composite_test03 ( dim_num, level_max ); 
% 
%  Test sum of weights for DIMENSION, LEVEL_MAX. 
% 
  sparse_grid_composite_test04 ( 2, 4 ); 
  sparse_grid_composite_test04 ( 3, 0 ); 
  sparse_grid_composite_test04 ( 3, 1 ); 
  sparse_grid_composite_test04 ( 3, 6 ); 
  sparse_grid_composite_test04 ( 10, 3 ); 
% 
%  Test monomial exactness for DIMENSION, LEVEL_MAX, DEGREE_MAX. 
% 
  sparse_grid_composite_test05 ( 2, 0, 2 ); 
  sparse_grid_composite_test05 ( 2, 1, 2 ); 
  sparse_grid_composite_test05 ( 2, 2, 2 ); 
  sparse_grid_composite_test05 ( 2, 3, 2 ); 
  sparse_grid_composite_test05 ( 2, 4, 2 ); 
  sparse_grid_composite_test05 ( 2, 5, 2 ); 

  sparse_grid_composite_test05 ( 3, 0, 2 ); 
  sparse_grid_composite_test05 ( 3, 1, 2 ); 
  sparse_grid_composite_test05 ( 3, 2, 2 ); 
  sparse_grid_composite_test05 ( 3, 3, 2 );
%
%  Show how to write a rule to a file.
%
  dim_num = 2;
  level_max = 3;
  sparse_grid_composite_test06 ( dim_num, level_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_COMPOSITE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

