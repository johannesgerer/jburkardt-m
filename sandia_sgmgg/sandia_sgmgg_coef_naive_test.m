function sandia_sgmgg_coef_naive_test ( dim_num, point_num, sparse_index  )

%*****************************************************************************80
%
%% SANDIA_SGMGG_COEF_NAIVE_TEST demonstrates "naive" coefficient computations.
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

  coef = sandia_sgmgg_coef_naive ( dim_num, point_num, sparse_index );

  i4vec_print ( point_num, coef, '  COEF:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  COEF Sum = %d\n', sum ( coef(1:point_num) ) );

  return
end
