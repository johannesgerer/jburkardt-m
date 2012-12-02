function test_approx_test09 ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST09 uses B spline approximation on all problems.
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
  fprintf ( 1, 'TEST_APPROX_TEST09\n' );
  fprintf ( 1, '  B spline approximation.\n' );

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
    fprintf ( 1, '       X        Y\n' );
    fprintf ( 1, '\n' );
%
%  Evaluate the interpolation function.
%
    for i = 1 : data_num - 1

      jmax = 3;

      if ( i == data_num - 1 )
        jhi = jmax;
      else
        jhi = jmax - 1;
      end

      for j = 1 : jhi

        xval = ( ( jmax - j     ) * xdata(i)     ...
               + (        j - 1 ) * xdata(i+1) ) ...
               / ( jmax     - 1 );

        yval = spline_b_val ( data_num, xdata, ydata, xval );

        if ( j == 1 || j == 3 )
          mark = '*';
        else
          mark = ' ';
        end

        fprintf ( 1, '  %c  %14g  %14g\n', mark, xval, yval );

      end

    end

  end

  return
end
