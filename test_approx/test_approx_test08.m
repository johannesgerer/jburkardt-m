function test_approx_test08 ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST08 plots a cubic spline interpolant for problem 7.
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
  approx_filename = 'test08_approx.txt';
  data_filename = 'test08_data.txt';
  jmax = 7;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST08\n' );
  fprintf ( 1, '  Plot a cubic spline interpolant for problem 7.\n' );

  prob = 7;
%
%  Get the data.
%
  data_num = p00_data_num ( prob );

  [ xdata, ydata ] = p00_dat ( prob, data_num );

  r8vec2_write ( data_filename, data_num, xdata, ydata );

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
  plot = 0;
  nplot = ( jmax - 1 ) * ( data_num - 1 ) + 1;
  xplot = zeros ( nplot, 1 );
  yplot = zeros ( nplot, 1 );

  for i = 1 : data_num - 1

    if ( i == data_num - 1 )
      jhi = jmax;
    else
      jhi = jmax - 1;
    end

   for j = 1 : jhi

      xval = ( ( jmax - j     ) * xdata(i)     ...
             + (        j - 1 ) * xdata(i+1) ) ...
             / ( jmax     - 1 );

      [ yval, ypval, yppval ] = spline_cubic_val ( data_num, xdata, ydata, ...
        ypp, xval );

      plot = plot + 1;
      xplot(plot) = xval;
      yplot(plot) = yval;

    end

  end

  r8vec2_write ( approx_filename, nplot, xplot, yplot );

  fprintf ( 1, '  Approximant values stored in "%s"\n', approx_filename );

  return
end
