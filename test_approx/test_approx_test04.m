function test_approx_test04 ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST04 uses linear spline interpolation on all problems.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST04\n' );
  fprintf ( 1, '  Linear spline interpolation.\n' );

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num

    title = p00_title ( prob );

    data_num = p00_data_num ( prob );

    [ xdata, ydata ] = p00_dat ( prob, data_num );

    a = xdata(1);
    b = xdata(data_num);

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem %d\n', prob );
    fprintf ( 1, '  %s\n', title );
    fprintf ( 1, '\n' );
    fprintf ( 1, '       X          Y          Y''\n' );
    fprintf ( 1, '\n' );
%
%  Evaluate the interpolation function.
%
    imax = 2 * data_num - 1;

    for i = 1 : imax

      xval = ( ( imax - i     ) * a   ...
             + (        i - 1 ) * b ) ...
             / ( imax     - 1 );

      [ yval, ypval ] = spline_linear_val ( data_num, xdata, ydata, xval );

      if ( mod ( i, 2 ) == 1 )
        mark = '*';
      else
        mark = ' ';
      end

      fprintf ( 1, '  %c  %14g  %14g  %14g\n', mark, xval, yval, ypval );

    end

  end

  return
end
