function prob_test046 ( )

%*****************************************************************************80
%
%% TEST046 tests DIPOLE_SAMPLE.
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
  ntest = 3;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST046\n' );
  fprintf ( 1, '  For the Dipole PDF:\n' );
  fprintf ( 1, '  DIPOLE_SAMPLE samples.\n' );

  atest(1:3) = [ 0.0, pi / 4.0, pi / 2.0 ];
  btest(1:3) = [ 1.0, 0.5, 0.0 ];

  for itest = 1 : ntest

    a = atest(itest);
    b = btest(itest);

    check = dipole_check ( a, b );

    if ( ~check );
      fprintf ( 1, '\n' );
      fprintf ( 1, 'TEST046 - Fatal error!\n' );
      fprintf ( 1, '  The parameters are not legal.\n' );
      return
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  PDF parameter A = %14f\n', a );
    fprintf ( 1, '  PDF parameter B = %14f\n', b );
  
    for i = 1 : nsample
      [ x(i), seed ] = dipole_sample ( a, b, seed );
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
