function sgmga_aniso_balance_tests ( )

%*****************************************************************************80
%
%% SGMGA_ANISO_BALANCE_TESTS call SGMGA_ANISO_BALANCE_TEST.
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
  fprintf ( 1, 'SGMGA_ANISO_BALANCE_TESTS\n' );
  fprintf ( 1, '  Call SGMGA_ANISO_BALANCE_TEST with various arguments.\n' );

  test_num = 5;

  alpha_max = 10.0;
  seed = 123456789;
  dim_num = 5;
  for test = 1 : test_num
    [ level_weight, seed ] = r8vec_uniform_01 ( dim_num, seed );
    level_weight(1:dim_num) = 10.0 * level_weight(1:dim_num);
    sgmga_aniso_balance_test ( alpha_max, dim_num, level_weight );
  end

  alpha_max = 5.0;
  seed = 123456789;
  dim_num = 5;
  for test = 1 : test_num
    [ level_weight, seed ] = r8vec_uniform_01 ( dim_num, seed );
    level_weight(1:dim_num) = 10.0 * level_weight(1:dim_num);
    sgmga_aniso_balance_test ( alpha_max, dim_num, level_weight );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_ANISO_BALANCE_TESTS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
