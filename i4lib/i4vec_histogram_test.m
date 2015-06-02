function i4vec_histogram_test ( )

%*****************************************************************************80
%
%% I4VEC_HISTOGRAM_TEST tests I4VEC_HISTOGRAM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'I4VEC_HISTOGRAM_TEST\n' );
  fprintf ( 1, '  I4VEC_HISTOGRAM histograms an integer vector.\n' );

  [ a, seed ] = i4vec_uniform_ab ( n, 0, 25, seed );

  histo_num = 20;

  histo_gram = i4vec_histogram ( n, a, histo_num );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Histogram of data from 0 to %d\n', histo_num );
  fprintf ( 1, '\n' );

  for i = 0 : histo_num
    if ( 0 < histo_gram(i+1) )
      fprintf ( 1, '  %6d  %6d\n', i, histo_gram(i+1) );
    end
  end

  return
end
