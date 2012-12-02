function r8lib_test122 ( )

%*****************************************************************************80
%
%% TEST122 tests R8VEC_HISTOGRAM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  histo_num = 20;
  n = 1000;

  seed = 123456789;
  test_num = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST122\n' );
  fprintf ( 1, '  R8VEC_HISTOGRAM histograms an integer vector.\n' );

  for test = 1 : test_num

    if ( test == 1 )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Uniform data:\n' );

      a_lo =  0.0;
      a_hi = +1.0;
      [ a, seed ] = r8vec_uniform_01 ( n, seed );

    elseif ( test == 2 )

      fprintf ( 1, '\n' );
      fprintf ( 1, '  Normal data:\n' );
      a_lo = -3.0;
      a_hi = +3.0;
      [ a, seed ] = r8vec_normal_01 ( n, seed );

    end

    histo_gram = r8vec_histogram ( n, a, a_lo, a_hi, histo_num );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Histogram of data:\n' );
    fprintf ( 1, '\n' );

    for i = 0 : histo_num+1

      if ( i == 0 )

        fprintf ( 1, '              %10f  %6d\n', a_lo, histo_gram(i+1) );

      elseif ( i <= histo_num )

        bin_lo = ( ( histo_num - i + 1 ) * a_lo   ...
                 + (             i - 1 ) * a_hi ) ...
                 / ( histo_num         );

        bin_hi = ( ( histo_num - i ) * a_lo   ...
                 + (             i ) * a_hi ) ...
                 / ( histo_num     );

        fprintf ( 1, '  %10f  %10f  %6d\n', bin_lo, bin_hi, histo_gram(i+1) );

      elseif ( i == histo_num+1 )

        fprintf ( 1, '  %10f              %6d\n', a_hi, histo_gram(i+1) );

      end

    end

  end

  return
end

