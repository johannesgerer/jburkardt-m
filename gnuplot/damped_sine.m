function damped_sine ( )

%*****************************************************************************80
%
%% DAMPED_SINE evaluates and plots the damped sine correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2013
%
%  Author:
%
%    John Burkardt
%
  n = 101;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'DAMPED_SINE\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Demonstrating how a correlation function can be\n' );
  fprintf ( 1, '  evaluated and plotted using GNUPLOT.\n' );
%
%  damped_sine
%
  rho0 = 1.0;
  rho = linspace ( -12.0, +12.0, n );
  c = correlation_damped_sine ( n, rho, rho0 );
  correlation_plot ( n, rho, c, 'damped_sine', 'Damped sine correlation' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'DAMPED_SINE\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  return
end
function c = correlation_damped_sine ( n, rho, rho0 )

%*****************************************************************************80
%
%% CORRELATION_DAMPED_SINE evaluates the damped sine correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Petter Abrahamsen,
%    A Review of Gaussian Random Fields and Correlation Functions,
%    Norwegian Computing Center, 1997.
%
%  Parameters:
%
%    Input, integer N, the number of arguments.
%
%    Input, real RHO(N), the arguments.
%
%    Input, real RHO0, the correlation length.
%
%    Output, real C(N), the correlations.
%
  rho = rho(:);
  c = ones ( n, 1 );
  i = find ( rho ~= 0.0 );
  c(i) = rho0 * sin ( abs ( rho(i) ) / rho0 ) ./ abs ( rho(i) );

  return
end
function correlation_plot ( n, rho, c, header, title )

%*****************************************************************************80
%
%% CORRELATION_PLOT makes a plot of a correlation function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of arguments.
%
%    Input, real RHO(N), the arguments.
%
%    Input, real C(N), the correlations.
%
%    Input, string HEADER, an identifier for the files.
%
%    Input, string TITLE, a title for the plot.
%
  data_filename = strcat ( header, '_data.txt' );
  data_unit = fopen ( data_filename, 'wt' );
  for i = 1 : n
    fprintf ( data_unit, '  %14.6g  %14.6g\n', rho(i), c(i) );
  end
  fclose ( data_unit );
  fprintf ( 1, '  Created data file "%s"\n', data_filename );

  command_filename = strcat ( header, '_commands.txt' );
  command_unit = fopen ( command_filename, 'wt' );
  fprintf ( command_unit, '# %s\n', command_filename );
  fprintf ( command_unit, '#\n' );
  fprintf ( command_unit, '# Usage:\n' );
  fprintf ( command_unit, '#  gnuplot < %s\n', command_filename );
  fprintf ( command_unit, '#\n' );
  fprintf ( command_unit, 'set term png\n' );
  fprintf ( command_unit, 'set output "%s.png"\n', header );
  fprintf ( command_unit, 'set xlabel "Distance Rho"\n' );
  fprintf ( command_unit, 'set ylabel "Correlation C(Rho)"\n' );
  fprintf ( command_unit, 'set title "%s"\n', title );
  fprintf ( command_unit, 'set grid\n' );
  fprintf ( command_unit, 'set style data lines\n' );
  fprintf ( command_unit, 'plot "%s" using 1:2 lw 3 linecolor rgb "blue"\n', data_filename );
  fprintf ( command_unit, 'quit\n' );
  fclose ( command_unit );
  fprintf ( 1, '  Created command file "%s"\n', command_filename );

  return
end
