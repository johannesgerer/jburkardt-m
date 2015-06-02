function normal_ms_variance_test ( )

%*****************************************************************************80
%
%% NORMAL_MS_VARIANCE_TEST tests NORMAL_MS_VARIANCE.
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
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NORMAL_MS_VARIANCE_TEST\n' );
  fprintf ( 1, '  NORMAL_MS_VARIANCE returns the variance\n' );
  fprintf ( 1, '  of the Normal MS distribution.\n' );

  mu = 100.0;
  sigma = 15.0;

  variance = normal_ms_variance ( mu, sigma );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter MU =    %14f\n', mu );
  fprintf ( 1, '  PDF parameter SIGMA = %14f\n', sigma );
  fprintf ( 1, '  PDF variance =        %14f\n', variance );

  nsample = 1000;
  seed = 123456789;

  for i = 1 : nsample
    [ x(i), seed ] = normal_ms_sample ( mu, sigma, seed );
  end

  variance = var ( x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample size =     %6d\n', nsample );
  fprintf ( 1, '  Sample variance = %14f\n', variance );

  return
end
