function chebyshev_polynomial_test ( )

%*****************************************************************************80
%
%% CHEBYSHEV_POLYNOMIAL_TEST tests the CHEBYSHEV_POLYNOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the CHEBYSHEV_POLYNOMIAL library.\n' );

  chebyshev_polynomial_test01 ( );
  chebyshev_polynomial_test02 ( );
  chebyshev_polynomial_test03 ( );
  chebyshev_polynomial_test04 ( );
  chebyshev_polynomial_test05 ( );
  chebyshev_polynomial_test06 ( );
  chebyshev_polynomial_test07 ( );
  chebyshev_polynomial_test08 ( );
  chebyshev_polynomial_test09 ( );

  chebyshev_polynomial_test10 ( );
  chebyshev_polynomial_test11 ( );
  chebyshev_polynomial_test12 ( );
  chebyshev_polynomial_test13 ( );
  chebyshev_polynomial_test14 ( );
  chebyshev_polynomial_test15 ( );
  chebyshev_polynomial_test16 ( );
  chebyshev_polynomial_test17 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
