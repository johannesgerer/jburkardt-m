function test_approx_test03 ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST03 uses polynomial interpolation on data vector problems.
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
  max_tab = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST03\n' );
  fprintf ( 1, '  Polynomial interpolation to a vector of data.\n' );

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num

    title = p00_title ( prob );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Problem  %d\n', prob );
    fprintf ( 1, '  %s\n', title )

    data_num = p00_data_num ( prob );

    fprintf ( 1, '  DATA_NUM = %d\n', data_num )

    if ( max_tab < data_num )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  This problem has too much data for polynomial interpolation.\n' );
      continue
    end

    [ xdata, ydata ] = p00_dat ( prob, data_num );

    ntab = data_num;

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Interpolating polynomial order = %d\n', ntab );
    fprintf ( 1, '\n' );
%
%  Construct the interpolating polynomial via finite differences.
%
    diftab = data_to_dif ( ntab, xdata, ydata );
%
%  Print out the approximation, including midpoints of the intervals.
%
    for i = 1 : ntab

      if ( i < ntab )
        jhi = 2;
      else
        jhi = 1;
      end

      for j = 1 : jhi

        if ( i < ntab )
          x = ( ( jhi - j + 1 ) * xdata(i)     ...
              + (       j - 1 ) * xdata(i+1) ) ...
              / ( jhi         );
        else
          x = xdata(ntab);
        end

        if ( j == 1 )
          mark = '*';
        else
          mark = ' ';
        end

        yapprox = dif_val ( ntab, xdata, diftab, x );

        fprintf ( 1, '  %c  %14g  %14g\n', mark, x, yapprox );

      end

    end

  end

  return
end
