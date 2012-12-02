function sgmga_vcn_timing_tests ( )

%*****************************************************************************80
%
%% SGMGA_VCN_TIMING_TESTS times SGMGA_VCN and SGMGA_VCN_NAIVE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    20 May 2010
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../sandia_rules' );

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_VCN_TIMING_TESTS\n' );
  fprintf ( 1, '  calls SGMGA_VCN_TIMING_TEST.\n' );
%
%  Isotropic examples.
%
  dim_num = 2;

  for test = 1 : 2

    dim_num = dim_num * 2;
    importance(1:dim_num,1) = 1.0;
    level_weight = sgmga_importance_to_aniso ( dim_num, importance );
    level_max = 2;
    q_min = level_max - sum ( level_weight(1:dim_num) );
    q_max = level_max;

    sgmga_vcn_timing_test ( dim_num, importance, level_weight, q_min, q_max );

  end
%
%  Anisotropic examples.
%
  dim_num = 1;

  for test = 1 : 2

    dim_num = dim_num + 2;
    importance(1:dim_num,1) = ( 1 : dim_num );
    level_weight = sgmga_importance_to_aniso ( dim_num, importance );
    level_max = 2;
    q_min = level_max - sum ( level_weight(1:dim_num) );
    q_max = level_max;

    sgmga_vcn_timing_test ( dim_num, importance, level_weight, q_min, q_max );

  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_VCN_TIMING_TESTS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
