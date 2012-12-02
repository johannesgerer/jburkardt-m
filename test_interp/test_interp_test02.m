function test_interp_test02 ( )

%*****************************************************************************80
%
%% TEST_INTERP_TEST02 prints the data for each problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_TEST02\n' );
  fprintf ( 1, '  P00_DATA_NUM returns N, the number of data points.\n' );
  fprintf ( 1, '  P00_DIM_NUM returns M, the dimension of data.\n' );
  fprintf ( 1, '  P00_DATA returns the actual (MxN) data.\n' );

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', prob );

    data_num = p00_data_num ( prob );
    fprintf ( 1, '  DATA_NUM = %d\n', data_num );

    dim_num = p00_dim_num ( prob );
    fprintf ( 1, '  DIM_NUM  = %d\n', dim_num );

    p = p00_data ( prob, dim_num, data_num );

    r8mat_transpose_print ( dim_num, data_num, p, '  Data array:' );

  end

  return
end
