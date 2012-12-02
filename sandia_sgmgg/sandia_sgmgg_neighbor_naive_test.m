function sandia_sgmgg_neighbor_naive_test ( dim_num, point_num, sparse_index  )

%*****************************************************************************80
%
%% SANDIA_SGMGG_NEIGHBOR_NAIVE_TEST demonstrates "naive" neighbor computations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 August 2011
%
%  Author:
%
%    John Burkardt
%
  i4mat_transpose_print ( dim_num, point_num, sparse_index, ...
    '  SPARSE_INDEX:' );

  neighbor = sandia_sgmgg_neighbor_naive ( dim_num, point_num, sparse_index );

  i4mat_transpose_print ( dim_num, point_num, neighbor, ...
    '  NEIGHBOR:' );

  return
end
