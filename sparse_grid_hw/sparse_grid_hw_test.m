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
%    30 November 2012
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

  ccs_sparse_test ( );
  ccs_test ( );
  ccu_sparse_test ( );
  ccu_test ( );
  get_seq_test ( );
  gqn_sparse_test ( );
  gqn_test ( );
  gqu_sparse_test ( );
  gqu_test ( );
  kpn_sparse_test ( );
  kpn_test ( );
  kpu_sparse_test ( );
  kpu_test ( );
  nwspgr_size_test ( );
  nwspgr_test ( );
  order_report ( );
  pack_rules_test ( );
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
