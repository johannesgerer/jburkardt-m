function prob_test078 ( )

%*****************************************************************************80
%
%% TEST078 tests GAMMA_MEAN, GAMMA_SAMPLE, GAMMA_VARIANCE.
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
  test_num = 2;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST078\n' );
  fprintf ( 1, '  For the Gamma PDF:\n' );
  fprintf ( 1, '  GAMMA_MEAN computes the mean;\n' );
  fprintf ( 1, '  GAMMA_SAMPLE samples;\n' );
  fprintf ( 1, '  GAMMA_VARIANCE computes the variance.\n' );

  a_test(1:2) = [ 1.0, 2.0 ];
  b_test(1:2) = [ 3.0, 0.5 ];
  c_test(1:2) = [ 2.0, 0.5 ];

  for test_i = 1 : test_num

    a = a_test(test_i);
    b = b_test(test_i);
    c = c_test(test_i);

    check = gamma_check ( a, b, c );

    if ( ~check );
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST078 - Fatal error!\n' );
      fprintf ( 1, '  The parameters are not legal.\n' );
      return
    end

    mean = gamma_mean ( a, b, c );
    variance = gamma_variance ( a, b, c );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  TEST NUMBER: %6d\n', test_i );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  PDF parameter A =             %14f\n', a );
    fprintf ( 1, '  PDF parameter B =             %14f\n', b );
    fprintf ( 1, '  PDF parameter C =             %14f\n', c );
    fprintf ( 1, '  PDF mean =                    %14f\n', mean );
    fprintf ( 1, '  PDF variance =                %14f\n', variance );
  
    for i = 1 : nsample
      [ x(i), seed ] = gamma_sample ( a, b, c, seed );
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
