function prob_test034 ( )

%*****************************************************************************80
%
%% TEST034 tests CHI_SQUARE_MEAN, CHI_SQUARE_SAMPLE, CHI_SQUARE_VARIANCE.
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
  fprintf ( 1, 'TEST034\n' );
  fprintf ( 1, '  For the central chi square PDF:\n' );
  fprintf ( 1, '  CHI_SQUARE_MEAN computes the mean;\n' );
  fprintf ( 1, '  CHI_SQUARE_SAMPLE samples;\n' );
  fprintf ( 1, '  CHI_SQUARE_VARIANCE computes the variance.\n' );

  a = 10.0;

  check = chi_square_check ( a );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST034 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = chi_square_mean ( a );
  variance = chi_square_variance ( a );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter A = %14f\n', a );
  fprintf ( 1, '  PDF mean =        %14f\n', mean );
  fprintf ( 1, '  PDF variance =    %14f\n', variance );
  
  for i = 1 : nsample
    [ x(i), seed ] = chi_square_sample ( a, seed );
  end

  mean = r8vec_mean ( nsample, x );
  variance = r8vec_variance ( nsample, x );
  xmax = max ( x(1:nsample) );
  xmin = min ( x(1:nsample) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %14f\n', xmax );
  fprintf ( 1, '  Sample minimum =  %14f\n', xmin );

  return
end
