function bernstein_polynomial_test ( )

%*****************************************************************************80
%
%% BERNSTEIN_POLYNOMIAL_TEST tests the BERNSTEIN_POLYNOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNSTEIN_POLYNOMIAL_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the BERNSTEIN_POLYNOMIAL library.\n' );

  bernstein_polynomial_test01 ( );
  bernstein_polynomial_test02 ( );
  bernstein_polynomial_test03 ( )
  bernstein_polynomial_test04 ( );
  bernstein_polynomial_test05 ( );
  bernstein_polynomial_test06 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BERNSTEIN_POLYNOMIAL_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end



