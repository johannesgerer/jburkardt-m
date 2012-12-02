function sgmga_product_weight_tests ( )

%****************************************************************************80
%
%% SGMGA_PRODUCT_WEIGHT_TESTS calls SGMGA_PRODUCT_WEIGHT_TEST.
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
  fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT_TESTS\n' );
  fprintf ( 1, '  Call SGMGA_PRODUCT_WEIGHT_TEST with various arguments.\n' );

  dim_num = 2;
  order_1d = [ 3, 5 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 1, 1 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  sgmga_product_weight_test ( dim_num, order_1d, order_nd, rule, np, p );

  dim_num = 2;
  order_1d = [ 3, 7 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 1, 5 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  sgmga_product_weight_test ( dim_num, order_1d, order_nd, rule, np, p );

  dim_num = 2;
  order_1d = [ 3, 3 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 3, 7 ]';
  np = [ 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  sgmga_product_weight_test ( dim_num, order_1d, order_nd, rule, np, p );

  dim_num = 2;
  order_1d = [ 5, 5 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 1, 8 ]';
  np = [ 0, 1 ]';
  np_sum = sum ( np(1:dim_num) );
  p(1,1) = 1.5;
  sgmga_product_weight_test ( dim_num, order_1d, order_nd, rule, np, p );

  dim_num = 2;
  order_1d = [ 5, 5 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 2, 9 ]';
  np = [ 0, 2 ]';
  np_sum = sum ( np(1:dim_num) );
  p(1,1) = 0.5;
  p(2,1) = 1.5;
  sgmga_product_weight_test ( dim_num, order_1d, order_nd, rule, np, p );

  dim_num = 2;
  order_1d = [ 7, 9 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 6, 10 ]';
  np = [ 1, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p(1,1) = 2.0;
  sgmga_product_weight_test ( dim_num, order_1d, order_nd, rule, np, p );

  dim_num = 3;
  order_1d = [ 2, 3, 3 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 1, 4, 5 ]';
  np = [ 0, 0, 0 ]';
  np_sum = sum ( np(1:dim_num) );
  p = [];
  sgmga_product_weight_test ( dim_num, order_1d, order_nd, rule, np, p );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SGMGA_PRODUCT_WEIGHT_TESTS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
