function test007 ( )

%*****************************************************************************80
%
%% TEST007 tests ARCSIN_MEAN, ARCSIN_SAMPLE, ARCSIN_VARIANCE.
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
  fprintf ( 1, 'TEST007\n' );
  fprintf ( 1, '  For the Arcsin PDF:\n' );
  fprintf ( 1, '  ARCSIN_MEAN computes the mean;\n' );
  fprintf ( 1, '  ARCSIN_SAMPLE samples;\n' );
  fprintf ( 1, '  ARCSIN_VARIANCE computes the variance.\n' );

  for i = 1 : 2

    if ( i == 1 );
      a = 1.0;
    elseif ( i == 2 );
      a = 16.0;
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  PDF parameter A = %14f\n', a );

    if ( ~arcsin_check ( a ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST007 - Fatal error!\n' );
      fprintf ( 1, '  The parameters are not legal.\n' );
      return
    end

    mean = arcsin_mean ( a );
    variance = arcsin_variance ( a );

    fprintf ( 1, '  PDF mean =        %14f\n', mean );
    fprintf ( 1, '  PDF variance =    %14f\n', variance );
  
    for j = 1 : nsample
      [ x(j), seed ]= arcsin_sample ( a, seed );
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

  end

  return
end
