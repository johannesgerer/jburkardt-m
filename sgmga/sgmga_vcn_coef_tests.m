function sgmga_vcn_coef_tests ( )

%*****************************************************************************80
%
%% SGMGA_VCN_COEF_TESTS tests SGMGA_VCN_COEF.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_VCN_COEF_TESTS\n' );
  fprintf ( 1, '  calls SGMGA_VCN_COEF_TEST.\n' );

  dim_num = 2;
  for dim = 1 : dim_num
    importance(dim,1) = 1.0;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max_min = 0;
  level_max_max = 4;
  sgmga_vcn_coef_test ( dim_num, importance, level_weight, level_max_min, ...
    level_max_max );

  dim_num = 2;
  for dim = 1 : dim_num
    importance(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max_min = 0;
  level_max_max = 4;
  sgmga_vcn_coef_test ( dim_num, importance, level_weight, level_max_min, ...
    level_max_max );

  dim_num = 3;
  for dim = 1 : dim_num
    importance(dim,1) = 1.0;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max_min = 0;
  level_max_max = 4;
  sgmga_vcn_coef_test ( dim_num, importance, level_weight, level_max_min, ...
    level_max_max );

  dim_num = 3;
  for dim = 1 : dim_num
    importance(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max_min = 0;
  level_max_max = 4;
  sgmga_vcn_coef_test ( dim_num, importance, level_weight, level_max_min, ...
    level_max_max );

  dim_num = 4;
  for dim = 1 : dim_num
    importance(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max_min = 0;
  level_max_max = 3;
  sgmga_vcn_coef_test ( dim_num, importance, level_weight, level_max_min, ...
    level_max_max );
%
%  Try a case with a dimension of "0 importance".
%
  dim_num = 3;
  importance = [ 1.0, 0.0, 1.0 ];
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max_min = 0;
  level_max_max = 3;
  sgmga_vcn_coef_test ( dim_num, importance, level_weight, level_max_min, ...
    level_max_max );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_VCN_COEF_TESTS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
