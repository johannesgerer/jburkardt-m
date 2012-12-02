function hermite_polynomial_test ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_TEST tests HERMITE_POLYNOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the HERMITE_POLYNOMIAL library.\n' );

  hermite_polynomial_test01 ( );
  hermite_polynomial_test02 ( );
  hermite_polynomial_test03 ( );
  hermite_polynomial_test04 ( );
  hermite_polynomial_test05 ( );
  hermite_polynomial_test06 ( );
  hermite_polynomial_test07 ( );

  p = 5;
  b = 0.0;
  hermite_polynomial_test08 ( p, b );

  p = 5;
  b = 1.0;
  hermite_polynomial_test08 ( p, b );

  p = 5;
  e = 0;
  hermite_polynomial_test09 ( p, e );

  p = 5;
  e = 1;
  hermite_polynomial_test09 ( p, e );

  p = 5;
  b = 0.0;
  hermite_polynomial_test10 ( p, b );

  p = 5;
  b = 1.0;
  hermite_polynomial_test10 ( p, b );

  p = 5;
  e = 0;
  hermite_polynomial_test11 ( p, e );

  p = 5;
  e = 1;
  hermite_polynomial_test11 ( p, e );

  p = 5;
  b = 0.0;
  hermite_polynomial_test12 ( p, b );

  p = 5;
  b = 1.0;
  hermite_polynomial_test12 ( p, b );

  p = 5;
  e = 0;
  hermite_polynomial_test13 ( p, e );

  p = 5;
  e = 1;
  hermite_polynomial_test13 ( p, e );

  hermite_polynomial_test14 ( );

  hermite_polynomial_test15 ( );

  hermite_polynomial_plot01 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



