function prob_test035 ( )

%*****************************************************************************80
%
%% TEST035 tests CHI_SQUARE_NONCENTRAL_MEAN, ***_SAMPLE, ***_VARIANCE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 2009
%
%  Author:
%
%    John Burkardt
%
  nsample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST035\n' );
  fprintf ( 1, '  For the noncentral chi square PDF:\n' );
  fprintf ( 1, '  CHI_SQUARE_NONCENTRAL_SAMPLE samples.\n' );

  a = 3.0;
  b = 2.0;

  check = chi_square_noncentral_check ( a, b );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST035 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = chi_square_noncentral_mean ( a, b );
  variance = chi_square_noncentral_variance ( a, b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF parameter B = %14f\n', b );
  fprintf ( 1, '  PDF mean =        %14f\n', mean );
  fprintf ( 1, '  PDF variance =    %14f\n', variance );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial seed =    %12d\n', seed );

  for i = 1 : nsample
    [ x(i), seed ] = chi_square_noncentral_sample ( a, b, seed );
  end

  mean = r8vec_mean ( nsample, x );
  variance = r8vec_variance ( nsample, x );
  xmax = max ( x(1:nsample) );
  xmin = min ( x(1:nsample) );

  fprintf ( 1, '  Final seed =      %12d\n', seed );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %14f\n', xmax );
  fprintf ( 1, '  Sample minimum =  %14f\n', xmin );

  return
end
