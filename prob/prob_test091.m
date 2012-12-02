function prob_test091 ( )

%*****************************************************************************80
%
%% TEST091 tests HYPERGEOMETRIC_MEAN, HYPERGEOMETRIC_SAMPLE, HYPERGEOMETRIC_VARIANCE.
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
  fprintf ( 1, 'TEST091\n' );
  fprintf ( 1, '  For the Hypergeometric PDF:\n' );
  fprintf ( 1, '  HYPERGEOMETRIC_MEAN computes the mean;\n' );
  fprintf ( 1, '  HYPERGEOMETRIC_SAMPLE samples;\n' );
  fprintf ( 1, '  HYPERGEOMETRIC_VARIANCE computes the variance.\n' );

  n = 100;
  m = 70;
  l = 1000;

  check = hypergeometric_check ( n, m, l );

  if ( ~check );
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEST091 - Fatal error!\n' );
    fprintf ( 1, '  The parameters are not legal.\n' );
    return
  end

  mean = hypergeometric_mean ( n, m, l );
  variance = hypergeometric_variance ( n, m, l );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter N =             %6d\n', n );
  fprintf ( 1, '  PDF parameter M =             %6d\n', m );
  fprintf ( 1, '  PDF parameter L =             %6d\n', l );
  fprintf ( 1, '  PDF mean =                    %14f\n', mean );
  fprintf ( 1, '  PDF variance =                %14f\n', variance );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'THIS CALL IS TAKING FOREVER!\n' );
  return

  for i = 1 : nsample
    [ x(i), seed ] = hypergeometric_sample ( n, m, l, seed );
  end

  mean = i4vec_mean ( nsample, x );
  variance = i4vec_variance ( nsample, x );
  xmax = i4vec_max ( nsample, x, imax );
  xmin = i4vec_min ( nsample, x, imin );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f\n', mean );
  fprintf ( 1, '  Sample variance = %14f\n', variance );
  fprintf ( 1, '  Sample maximum =  %6d\n', xmax );
  fprintf ( 1, '  Sample minimum =  %6d\n', xmin );

  return
end
