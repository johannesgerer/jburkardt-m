function hpp_test ( )

%*****************************************************************************80
%
%% HPP_TEST tests the HERMITE_PRODUCT_POLYNOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HPP_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the HERMITE_PRODUCT_POLYNOMIAL library.\n' );

  hpp_test01 ( );
  hpp_test015 ( );
  hpp_test02 ( );
  hpp_test03 ( );
  hpp_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HPP_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
