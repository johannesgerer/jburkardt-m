function jacobi_polynomial_test ( )

%*****************************************************************************80
%
%% JACOBI_POLYNOMIAL_TEST tests JACOBI_POLYNOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_POLYNOMIAL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the JACOBI_POLYNOMIAL library.\n' );

  jacobi_polynomial_test01 ( );
  jacobi_polynomial_test02 ( );
  jacobi_polynomial_test03 ( );
  jacobi_polynomial_test04 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'JACOBI_POLYNOMIAL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



