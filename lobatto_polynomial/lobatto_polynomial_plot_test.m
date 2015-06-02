function lobatto_polynomial_plot_test ( )

%*****************************************************************************80
%
%% LOBATTO_POLYNOMIAL_PLOT_TEST tests LOBATTO_POLYNOMIAL_PLOT.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LOBATTO_POLYNOMIAL_PLOT_TEST:\n' );
  fprintf ( 1, '  LOBATTO_POLYNOMIAL_PLOT plots Lobatto polynomials.\n' );

  index = [ 1, 2, 3, 4, 5, 6, 7 ];
  filename_value = 'lobatto_polynomial_value.png';
  filename_derivative = 'lobatto_polynomial_derivative.png';

  lobatto_polynomial_plot ( index, filename_value, filename_derivative );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created file "%s".\n', filename_value );
  fprintf ( 1, '  Created file "%s".\n', filename_derivative );
  return
end
