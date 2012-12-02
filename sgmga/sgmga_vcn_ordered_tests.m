function sgmga_vcn_ordered_tests ( )

%*****************************************************************************80
%
%% SGMGA_VCN_ORDERED_TESTS tests SGMGA_VCN_ORDERED.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 February 2010
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../sandia_rules' );

  timestamp ( );

  test_num = 12;

  dim_num_array(1:test_num) = [ 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4 ]';
  level_max_array(1:test_num) = [ 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 2, 3 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_VCN_ORDERED_TESTS\n' );
  fprintf ( 1, '  calls SGMGA_VCN_ORDERED_TEST.\n' );
%
%  isotropic examples.
%
  for test = 1 : test_num

    dim_num = dim_num_array(test);
    importance(1:dim_num,1) = 1.0;
    level_weight = sgmga_importance_to_aniso ( dim_num, importance );
    level_max = level_max_array(test);
    q_min = level_max - sum ( level_weight(1:dim_num) );
    q_max = level_max;

    sgmga_vcn_ordered_test ( dim_num, importance, level_weight, q_min, q_max );

  end
%
%  Anisotropic examples.
%
  for test = 1 : test_num

    dim_num = dim_num_array(test);
    importance(1:dim_num,1) = ( 1 : dim_num );
    level_weight = sgmga_importance_to_aniso ( dim_num, importance );
    level_max = level_max_array(test);
    q_min = level_max - sum ( level_weight(1:dim_num) );
    q_max = level_max;

    sgmga_vcn_ordered_test ( dim_num, importance, level_weight, q_min, q_max );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_VCN_ORDERED_TESTS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
