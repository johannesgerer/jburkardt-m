function prob_test068 ( )

%*****************************************************************************80
%
%% TEST068 tests F_MEAN, F_SAMPLE, F_VARIANCE.
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
  fprintf ( 1, 'TEST068\n' );
  fprintf ( 1, '  For the central F PDF:\n' );
  fprintf ( 1, '  F_MEAN computes the mean;\n' );
  fprintf ( 1, '  F_SAMPLE samples;\n' );
  fprintf ( 1, '  F_VARIANCE computes the varianc.\n' );

  m = 8;
  n = 6;

  if ( ~f_check ( m, n ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The parameters are not legal!\n' );
    return
  end

  mean = f_mean ( m, n );
  variance = f_variance ( m, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter M =       %6d\n', m );
  fprintf ( 1, '  PDF parameter N =       %6d\n', n );
  fprintf ( 1, '  PDF mean =              %14f\n', mean );
  fprintf ( 1, '  PDF variance =          %14f\n', variance );
  
  for i = 1 : nsample
    [ x(i), seed ] = f_sample ( m, n, seed );
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
