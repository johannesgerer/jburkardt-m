function sgmga_aniso_normalize_tests ( )

%*****************************************************************************80
%
%% SGMGA_ANISO_NORMALIZE_TESTS call SGMGA_ANISO_NORMALIZE_TEST.
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
  fprintf ( 1, 'SGMGA_ANISO_NORMALIZE_TESTS\n' );
  fprintf ( 1, '  Call SGMGA_ANISO_NORMALIZE_TEST with various arguments.\n' );

  dim_num = 2;
  level_weight(1:dim_num) = [ 1.0, 1.0 ]';
  sgmga_aniso_normalize_test ( dim_num, level_weight );

  dim_num = 2;
  level_weight(1:dim_num) = [ 10.0, 10.0 ]';
  sgmga_aniso_normalize_test ( dim_num, level_weight );

  dim_num = 2;
  level_weight(1:dim_num) = [ 10.0, 2.0 ]';
  sgmga_aniso_normalize_test ( dim_num, level_weight );

  dim_num = 2;
  level_weight(1:dim_num) = [ 1.0, 2.0 ]';
  sgmga_aniso_normalize_test ( dim_num, level_weight );

  dim_num = 3;
  level_weight(1:dim_num) = [ 1.0, 2.0, 3.0 ]';
  sgmga_aniso_normalize_test ( dim_num, level_weight );
%
%  Try a case in which one variable has 0 weight.
%
  dim_num = 3;
  level_weight(1:dim_num) = [ 2.0, 0.0, 1.5 ]';
  sgmga_aniso_normalize_test ( dim_num, level_weight );

  dim_num = 4;
  level_weight(1:dim_num) = [ 1.0, 2.0, 3.0, 4.0 ]';
  sgmga_aniso_normalize_test ( dim_num, level_weight );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_ANISO_NORMALIZE_TESTS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
