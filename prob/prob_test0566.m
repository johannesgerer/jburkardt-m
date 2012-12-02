function prob_test0566 ( )

%*****************************************************************************80
%
%% TEST0566 tests ENGLISH_WORD_LENGTH_MEAN, *_SAMPLE, *_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2006
%
%  Author:
%
%    John Burkardt
%
  sample_num = 1000;

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0566\n' );
  fprintf ( 1, '  For the English Word Length PDF:\n' );
  fprintf ( 1, '  ENGLISH_WORD_LENGTH_MEAN computes the mean;\n' );
  fprintf ( 1, '  ENGLISH_WORD_LENGTH_SAMPLE samples;\n' );
  fprintf ( 1, '  ENGLISH_WORD_LENGTH_VARIANCE computes the variance.\n' );

  mean = english_word_length_mean ( );
  variance = english_word_length_variance ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );

  for i = 1 : sample_num
    [ x(i), seed ] = english_word_length_sample ( seed );
  end

  mean = i4vec_mean ( sample_num, x );
  variance = i4vec_variance ( sample_num, x );
  xmax = i4vec_max ( sample_num, x );
  xmin = i4vec_min ( sample_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %12d\n', sample_num );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %14f\n', xmax );
  fprintf ( 1, '  Sample minimum =  %14f\n', xmin );

  return
end
