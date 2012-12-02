function product_mixed_weight_tests ( )

%*****************************************************************************80
%
%% PRODUCT_MIXED_WEIGHT_TESTS calls PRODUCT_MIXED_WEIGHT_TEST with various arguments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2010
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../sandia_rules' );

  fprintf ( 1, '\n' );
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRODUCT_MIXED_WEIGHT_TESTS\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Call PRODUCT_MIXED_WEIGHT_TEST with various arguments.\n' );

  dim_num = 2;
  order_1d = [ 3, 5 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 1, 1 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );

  dim_num = 2;
  order_1d = [ 3, 7 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 1, 5 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );

  dim_num = 2;
  order_1d = [ 3, 3 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 3, 7 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );

  dim_num = 2;
  order_1d = [ 5, 5 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 1, 8 ]';
  alpha = [ 0.0, 1.5 ]';
  beta = [ 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );

  dim_num = 2;
  order_1d = [ 5, 5 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 2, 9 ]';
  alpha = [ 0.0, 0.5 ]';
  beta = [ 0.0, 1.5 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );

  dim_num = 2;
  order_1d = [ 7, 7 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 6, 4 ]';
  alpha = [ 2.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );

  dim_num = 3;
  order_1d = [ 2, 3, 3 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 1, 3, 5 ]';
  alpha = [ 0.0, 0.0, 0.0 ]';
  beta = [ 0.0, 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );
%
%  Dimension 2, Rule 13
%
  dim_num = 2;
  order_1d = [ 15, 15 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 13, 13 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );
%
%  Dimension 2, Rule 16
%
  dim_num = 2;
  order_1d = [ 15, 15 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 16, 16 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );
%
%  Dimension 2, Rule 17
%
  dim_num = 2;
  order_1d = [ 15, 15 ]';
  order_nd = prod ( order_1d(1:dim_num) );
  rule = [ 17, 17 ]';
  alpha = [ 0.0, 0.0 ]';
  beta = [ 0.0, 0.0 ]';
  product_mixed_weight_test ( dim_num, order_1d, order_nd, rule, alpha, beta );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PRODUCT_MIXED_WEIGHT_TESTS\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../sandia_rules' );

  return
end
