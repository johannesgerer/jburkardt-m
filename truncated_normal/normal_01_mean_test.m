function normal_01_mean_test ( )

%*****************************************************************************80
%
%% NORMAL_01_MEAN_TEST tests NORMAL_01_MEAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_01_MEAN_TEST\n' );
  fprintf ( 1, '  NORMAL_01_MEAN computes the Normal 01 mean;\n' );

  m = normal_01_mean ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF mean =      %14f\n', m );

  nsample = 1000;
  seed = 123456789;

  for i = 1 : nsample
    [ x(i), seed ] = normal_01_sample ( seed );
  end

  ms = mean ( x );
  xmax = max ( x(1:nsample) );
  xmin = min ( x(1:nsample) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample mean =     %14f\n', ms );
  fprintf ( 1, '  Sample maximum =  %14f\n', xmax );
  fprintf ( 1, '  Sample minimum =  %14f\n', xmin );

  return
end
