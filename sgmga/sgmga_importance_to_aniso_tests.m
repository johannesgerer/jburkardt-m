function sgmga_importance_to_aniso_tests ( )

%*****************************************************************************80
%
%% SGMGA_IMPORTANCE_TO_ANISO_TESTS call SGMGA_IMPORTANCE_TO_ANISO_TEST.
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
  fprintf ( 1, 'SGMGA_IMPORTANCE_TO_ANISO_TESTS\n' );
  fprintf ( 1, ...
    '  Call SGMGA_IMPORTANCE_TO_ANISO_TEST with various arguments.\n' );

  dim_num = 2;
  importance(1:dim_num) = [ 1.0, 1.0 ]';
  sgmga_importance_to_aniso_test ( dim_num, importance );

  dim_num = 2;
  importance(1:dim_num) = [ 10.0, 10.0 ]';
  sgmga_importance_to_aniso_test ( dim_num, importance );

  dim_num = 2;
  importance(1:dim_num) = [ 10.0, 2.0 ]';
  sgmga_importance_to_aniso_test ( dim_num, importance );

  dim_num = 2;
  importance(1:dim_num) = [ 1.0, 2.0 ]';
  sgmga_importance_to_aniso_test ( dim_num, importance );

  dim_num = 3;
  importance(1:dim_num) = [ 1.0, 2.0, 3.0 ]';
  sgmga_importance_to_aniso_test ( dim_num, importance );
%
%  Try a case in which one variable has 0 importance.
%
  dim_num = 3;
  importance(1:dim_num) = [ 2.0, 0.0, 1.5 ]';
  sgmga_importance_to_aniso_test ( dim_num, importance );

  dim_num = 4;
  importance(1:dim_num) = [ 1.0, 2.0, 3.0, 4.0 ]';
  sgmga_importance_to_aniso_test ( dim_num, importance );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_IMPORTANCE_TO_ANISO_TESTS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
