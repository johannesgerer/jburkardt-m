function test_approx_test13 ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST13 plots a cubic spline interpolant for problem 5.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2011
%
%  Author:
%
%    John Burkardt
%
  nplot = 101;

  approx_filename = 'test13_approx.txt';
  data_filename = 'test13_data.txt';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST13\n' );
  fprintf ( 1, '  Plot a cubic spline interpolant for problem 5\n' );

  prob = 5;

  data_num = p00_data_num ( prob );

  [ xdata, ydata ] = p00_dat ( prob, data_num );

  r8vec2_write ( data_filename, data_num, xdata, ydata )

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data values stored in "%s"\n', data_filename );
%
%  Set up the interpolation function.
%
  ibcbeg = 0;
  ibcend = 0;
  ybcbeg = 0.0;
  ybcend = 0.0;

  ypp = spline_cubic_set ( data_num, xdata, ydata, ibcbeg, ybcbeg, ibcend, ...
    ybcend );
%
%  Evaluate the interpolation function.
%
  xplot = zeros ( nplot, 1 );
  yplot = zeros ( nplot, 1 );

  for j = 1 : nplot

    xval = ( ( nplot - j     ) * xdata(1)    ...
           + (         j - 1 ) * xdata(data_num) ) ...
           / ( nplot     - 1 );

    [ yval, ypval, yppval ] = spline_cubic_val ( data_num, xdata, ydata, ypp, ...
      xval );

    xplot(j) = xval;
    yplot(j) = yval;

  end

  r8vec2_write ( approx_filename, nplot, xplot, yplot );

  fprintf ( 1, '  Interpolant values stored in "%s"\n', approx_filename );

  return
end
