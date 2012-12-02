function tensor_product_test ( )

%*****************************************************************************80
%
%% TENSOR_PRODUCT_TEST tests TENSOR_PRODUCT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TENSOR_PRODUCT_TEST:\n' );
  fprintf ( 1, '  Given a sequence of 1D quadrature rules, construct the\n' );
  fprintf ( 1, '  tensor product rule.\n' );
%
%  1D rule.
%
  n1D = { [ -1.0; +1.0 ] };
  w1D = { [ 1.0; 1.0 ] };

  [ x, w ] = tensor_product ( n1D, w1D );
  
  x = x';

  [ m, n ] = size ( x );

  quad_rule_print ( m, n, x, w, '  A 1D rule over [-1,+1]:' );
%
%  2D rule.
%
  n1D{2} = [ 2.0; 2.5; 3.0 ];
  w1D{2} = [ 0.25; 0.50; 0.25 ];

  [ x, w ] = tensor_product ( n1D, w1D );
  x = x';
  
  [ m, n ] = size ( x );

  quad_rule_print ( m, n, x, w, '  A 2D rule over [-1,+1] x [2.0,3.0]:' );
%
%  3D rule.
%
  n1D{3} = [ 10.0; 15.0 ];
  w1D{3} = [ 2.50; 2.50 ];

  [ x, w ] = tensor_product ( n1D, w1D );
  x = x';  
  [ m, n ] = size ( x );

  quad_rule_print ( m, n, x, w, '  A 3D rule over [-1,+1] x [2.0,3.0] x [10.0,15.0]:' );

  return
end
