function test_approx_test12 ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST12 plots a Bernstein spline approximant for problem 7.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2012
%
%  Author:
%
%    John Burkardt
%
  approx_filename = 'test12_approx.txt';
  data_filename = 'test12_data.txt';
  nplot = 101;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST12\n' );
  fprintf ( 1, '  Plot a Bernstein approximant for problem 5.\n' );
  fprintf ( 1, '  Note that the Bernstein approximant requires equally\n' );
  fprintf ( 1, '  spaced data.\n' );

  prob = 5;
%
%  Get the data.
%
  data_num = p00_data_num ( prob );

  [ xdata, ydata ] = p00_dat ( prob, data_num );

  r8vec2_write ( data_filename, data_num, xdata, ydata )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data values stored in "%s"\n', data_filename );
%
%  Evaluate the approximant function.
%
  a = xdata(1);
  b = xdata(data_num);

  xplot = zeros ( nplot, 1 );
  yplot = zeros ( nplot, 1 );

  for plot = 1 : nplot

    xval = ( ( nplot - plot     ) * a     ...
           + (         plot - 1 ) * b ) ...
           / ( nplot        - 1 );

    yval = bpab_approx ( data_num - 1, a, b, ydata, xval );

    xplot(plot) = xval;
    yplot(plot) = yval;

  end

  r8vec2_write ( approx_filename, nplot, xplot, yplot );

  fprintf ( 1, '  Approximant values stored in "%s"\n', approx_filename );

  return
end
