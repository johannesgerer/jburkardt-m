function prob_test0745 ( )

%*****************************************************************************80
%
%% TEST0745 tests FRECHET_MEAN, FRECHET_SAMPLE and FRECHET_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
  sample_num = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0745\n' );
  fprintf ( 1, '  For the Frechet PDF:\n' );
  fprintf ( 1, '  FRECHET_MEAN computes the mean;\n' );
  fprintf ( 1, '  FRECHET_SAMPLE samples;\n' );
  fprintf ( 1, '  FRECHET_VARIANCE computes the variance.\n' );

  alpha = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter ALPHA =         %f\n', alpha );

  mean = frechet_mean ( alpha );
  variance = frechet_variance ( alpha );

  fprintf ( 1, '  PDF mean =                    %f\n', mean );
  fprintf ( 1, '  PDF variance =                %f\n', variance );

  for i = 1 : sample_num
    [ x(i), seed ] = frechet_sample ( alpha, seed );
  end

  mean = r8vec_mean ( sample_num, x );
  variance = r8vec_variance ( sample_num, x );
  [ xmax, imax ] = r8vec_max ( sample_num, x );
  [ xmin, imin ] = r8vec_min ( sample_num, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %f\n', sample_num );
  fprintf ( 1, '  Sample mean =     %f\n', mean );
  fprintf ( 1, '  Sample variance = %f\n', variance );
  fprintf ( 1, '  Sample maximum =  %f\n', xmax );
  fprintf ( 1, '  Sample minimum =  %f\n', xmin );

  return
end
