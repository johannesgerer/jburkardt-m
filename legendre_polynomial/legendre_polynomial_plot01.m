function legendre_polynomial_plot01 ( )

%*****************************************************************************80
%
%% LEGENDRE_POLYNOMIAL_PLOT01 tests P_POLYNOMIAL_PLOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LEGENDRE_POLYNOMIAL_PLOT01:\n' );
  fprintf ( 1, '  P_POLYNOMIAL_PLOT creates a plot of one or more Legendre functions.\n' );

  index = [ 0, 1, 2, 3, 4, 5 ];
  filename = 'p_polynomial_plot.png';

  p_polynomial_plot ( index, filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Legendre polynomial plot stored in file "%s".\n', filename );

  return
end
