function normal_ms_mean_test ( )

%*****************************************************************************80
%
%% NORMAL_MS_MEAN_TEST tests NORMAL_MS_MEAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 March 2015
%
%  Author:
%
%    John Burkardt
%
  nsample = 1000;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_MS_MEAN_TEST\n' );
  fprintf ( 1, '  NORMAL_MS_MEAN computes the mean\n' );
  fprintf ( 1, '  of the Normal MS distribution.\n' );

  mu = 100.0;
  sigma = 15.0;

  m = normal_ms_mean ( mu, sigma );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter MU =    %14f\n', mu );
  fprintf ( 1, '  PDF parameter SIGMA = %14f\n', sigma );
  fprintf ( 1, '  PDF mean =            %14f\n', m );

  for i = 1 : nsample
    [ x(i), seed ] = normal_ms_sample ( mu, sigma, seed );
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
