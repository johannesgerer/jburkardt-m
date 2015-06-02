function lobatto_polynomial_test ( )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_TEST tests the LOBATTO_POLYNOMIAL library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 May 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOBATTO_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the LOBATTO_POLYNOMIAL library.\n' );

  lobatto_polynomial_value_test ( );
  lobatto_polynomial_derivative_test ( );
  lobatto_polynomial_plot_test ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOBATTO_POLYNOMIAL_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
