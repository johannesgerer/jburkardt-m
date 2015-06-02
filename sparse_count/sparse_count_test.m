function sparse_count_test ( )

%*****************************************************************************80
%
%% SPARSE_COUNT_TEST tests the SPARSE_COUNT library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 September 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_COUNT_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPARSE_COUNT library.\n' );
%
%  CC_S
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test01 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test01 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  CFN_E
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test02 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test02 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  CFN_E_TOTAL
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test025 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  F2_S
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test03 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test03 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  GP_S
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test04 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test04 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  OFN_E
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test05 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test05 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  ONN_E
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test06 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test06 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  ONN_L
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test07 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test07 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  OWN_E
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test08 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test08 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  OWN_L
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test09 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test09 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  OWN_LS
%
  dim_min = 1;
  dim_max = 5;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test10 ( dim_min, dim_max, level_max_min, level_max_max );

  dim_min = 6;
  dim_max = 10;
  level_max_min = 0;
  level_max_max = 10;
  sparse_count_test10 ( dim_min, dim_max, level_max_min, level_max_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_COUNT_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
