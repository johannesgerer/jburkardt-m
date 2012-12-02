function hermite_polynomial_plot01 ( )

%*****************************************************************************80
%
%% HERMITE_POLYNOMIAL_PLOT01 tests HF_PLOT.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HERMITE_POLYNOMIAL_PLOT01:\n' );
  fprintf ( 1, '  HF_PLOT creates a plot of one or more Hermite functions.\n' );

  a = - 5.0;
  b = + 5.0;
  index = [ 0, 1, 2, 3, 4, 5 ];
  filename = 'hf_plot.png';

  hf_plot ( a, b, index, filename );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Hermite function plot stored in file "%s".\n', filename );

  return
end
