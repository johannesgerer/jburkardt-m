function test_approx_test07 ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST07 plots an Overhauser spline interpolant for problem 7.
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
  approx_filename = 'test07_approx.txt';
  data_filename = 'test07_data.txt';
  jmax = 7;
  num_dim = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST07\n' );
  fprintf ( 1, '  Plot an Overhauser spline interpolant for problem 7.\n' );
%
%  Get the problem data.
%
  prob = 7;

  data_num = p00_data_num ( prob );

  [ xdata, ydata ] = p00_dat ( prob, data_num );

  r8vec2_write ( data_filename, data_num, xdata, ydata );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data values stored in "%s"\n', data_filename );
%
%  Evaluate the approximating function.
%
  nplot = ( jmax - 1 ) * ( data_num - 1 ) + 1;
  xplot = zeros ( nplot, 1 );
  yplot = zeros ( nplot, 1 );

  plot = 0;

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

      yval = spline_overhauser_val ( num_dim, data_num, xdata, ydata, xval );

      plot = plot + 1;
      xplot(plot) = xval;
      yplot(plot) = yval;

    end

  end

  r8vec2_write ( approx_filename, nplot, xplot, yplot )

  fprintf ( 1, '  Approximant values stored in "%s"\n', approx_filename );

  return
end
