function piecewise_linear_product_integral_test ( )

%*****************************************************************************80
%
%% PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST tests the PIECEWISE_LINEAR_PRODUCT_INTEGRAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 April 2009
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PIECEWISE_LINEAR_PRODUCT_INTEGRAL library.\n' );

  piecewise_linear_product_integral_test01 ( );
  piecewise_linear_product_integral_test02 ( );
  piecewise_linear_product_integral_test03 ( );
  piecewise_linear_product_integral_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PIECEWISE_LINEAR_PRODUCT_INTEGRAL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
