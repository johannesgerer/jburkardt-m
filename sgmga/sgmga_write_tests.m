function sgmga_write_tests ( )

%****************************************************************************80
%
%% SGMGA_WRITE_TESTS calls SGMGA_WRITE_TEST with various arguments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Local Parameters:
%
%    Local, real TOL, a tolerance for point equality.
%    A value of sqrt ( eps ) is reasonable, and will allow the code to
%    consolidate points which are equal, or very nearly so.  A value of
%    -1.0, on the other hand, will force the code to use every point, regardless
%    of duplication.
%
  addpath ( '../sandia_rules' );

  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_WRITE_TESTS\n' );
  fprintf ( 1, '  Call SGMGA_WRITE_TEST with various arguments.\n' );
%
%  Set the point equality tolerance.
%
  tol = sqrt ( eps );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  All tests will use a point equality tolerance of %e\n', tol );

  dim_num = 2;
  for dim = 1 : dim_num
    importance(dim,1) = 1.0;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 1, 1 ]';
  growth = [ 6, 6 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l2_ccxcc_iso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 2;
  for dim = 1 : dim_num
    importance(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 1, 1 ]';
  growth = [ 6, 6 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l2_ccxcc_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 3;
  for dim = 1 : dim_num
    importance(dim,1) = 1.0;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 1, 1, 1 ]';
  growth = [ 6, 6, 6 ]';
  np = [ 0, 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d3_l2_ccxccxcc_iso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 3;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 1, 1, 1 ]';
  growth = [ 6, 6, 6 ]';
  np = [ 0, 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d3_l2_ccxccxcc_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 3;
  rule = [ 1, 3 ]';
  growth = [ 6, 6 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l3_ccxgp_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 1, 4 ]';
  growth = [ 6, 3 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l2_ccxgl_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 1, 7 ]';
  growth = [ 6, 3 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l2_ccxlg_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 1, 8 ]';
  growth = [ 6, 3 ]';
  np = [ 0, 1 ]';
  np_sum = sum ( np(1:dim_num) );
  p(1) = 1.5;
  file_name = 'sgmga_d2_l2_ccxglg_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 2, 9 ]';
  growth = [ 6, 3 ]';
  np = [ 0, 2 ]';
  np_sum = sum ( np(1:dim_num) );
  p(1,1) = 0.5;
  p(2,1) = 1.5;
  file_name = 'sgmga_d2_l2_f2xgj_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );

  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 6, 10 ]';
  growth = [ 3, 4 ]';
  np = [ 1, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p(1) = 1.0;
  file_name = 'sgmga_d2_l2_gghxhgk_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  LEVEL_MAX 1
%
  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 1;
  rule = [ 1, 1 ]';
  growth = [ 6, 6 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l1_ccxcc_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  LEVEL_MAX 2 already done
%
%  LEVEL_MAX 3
%
  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 3;
  rule = [ 1, 1 ]';
  growth = [ 6, 6 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l3_ccxcc_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  LEVEL_MAX 4
%
  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 4;
  rule = [ 1, 1 ]';
  growth = [ 6, 6 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l4_ccxcc_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  LEVEL_MAX 5
%
  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 5;
  rule = [ 1, 1 ]';
  growth = [ 6, 6 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l5_ccxcc_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  Dimension 3
%
  dim_num = 3;
  for dim = 1 : dim_num
    important(dim,1) = dim;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 2;
  rule = [ 1, 4, 5 ]';
  growth = [ 6, 3, 3 ]';
  np = [ 0, 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d3_l2_ccxglxgh_aniso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  Rule 3, LEVEL_MAX 4
%
  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = 1.0;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 4;
  rule = [ 3, 3 ]';
  growth = [ 6, 6 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l4_gpxgp_iso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  Rule 3, Growth 4, LEVEL_MAX 4
%
  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = 1.0;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 4;
  rule = [ 3, 3 ]';
  growth = [ 4, 4 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l4_gpsexgpse_iso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  Rule 3, Growth 5, LEVEL_MAX 4
%
  dim_num = 2;
  for dim = 1 : dim_num
    important(dim,1) = 1.0;
  end
  level_weight = sgmga_importance_to_aniso ( dim_num, importance );
  level_max = 4;
  rule = [ 3, 3 ]';
  growth = [ 5, 5 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  file_name = 'sgmga_d2_l4_gpmexgpme_iso';
  sgmga_write_test ( dim_num, level_weight, level_max, rule, growth, np, p, tol, ...
    file_name );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_WRITE_TESTS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
