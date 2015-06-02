function sparse_grid_hw_test ( )

%*****************************************************************************80
%
%% SPARSE_GRID_HW_TEST tests the SPARSE_GRID_HW library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_HW_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SPARSE_GRID_HW library.\n' );

  cce_test ( );
  cce_sparse_test ( );

  ccl_test ( );
  ccl_sparse_test ( );

  ccs_test ( );
  ccs_sparse_test ( );

  get_seq_test ( );

  glo_test ( );
  glo_sparse_test ( );

  gqn_test ( );
  gqn_sparse_test ( );

  gqu_test ( );
  gqu_sparse_test ( );

  kpn_test ( );
  kpn_sparse_test ( );

  kpu_test ( );
  kpu_sparse_test ( );

  nwspgr_size_test ( );
  nwspgr_time_test ( );
  nwspgr_test ( );

  order_report ( );

  symmetric_sparse_size_test ( );

  tensor_product_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SPARSE_GRID_HW_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
