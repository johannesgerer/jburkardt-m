function legendre_polynomial_test ( )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_TEST tests the LEGENDRE_POLYNOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the LEGENDRE_POLYNOMIAL library.\n' );

  legendre_polynomial_test01 ( );
  legendre_polynomial_test02 ( );
  legendre_polynomial_test03 ( );
  legendre_polynomial_test04 ( );

  p = 5;
  b = 0.0;
  legendre_polynomial_test05 ( p, b );

  p = 5;
  b = 1.0;
  legendre_polynomial_test05 ( p, b );

  p = 5;
  e = 0;
  legendre_polynomial_test06 ( p, e );

  p = 5;
  e = 1;
  legendre_polynomial_test06 ( p, e );

  legendre_polynomial_test07 ( );
  legendre_polynomial_test08 ( );
  legendre_polynomial_test09 ( );

  p = 5;
  legendre_polynomial_test10 ( p );

  legendre_polynomial_plot01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
