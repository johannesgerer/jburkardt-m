function truncated_normal_sparse_grid_test ( )

%*****************************************************************************80
%
%% TRUNCATED_NORMAL_SPARSE_GRID_TEST tests TRUNCATED_NORMAL_SPARSE_GRID library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_SPARSE_GRID_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TRUNCATED_NORMAL_SPARSE_GRID library.\n' );

  tno_order_test ( );
  tno_test ( );
  tno_persistence_test ( );
  tno_sparse_grid_test ( );

  tno_sparse_grid_size_test ( );
  tno_sparse_grid_test ( )
  tno_sparse_grid_write_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRUNCATED_NORMAL_SPARSE_GRID_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
