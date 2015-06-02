function normal_ms_sample_test ( )

%*****************************************************************************80
%
%% NORMAL_MS_SAMPLE_TEST tests NORMAL_MS_SAMPLE.
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
  fprintf ( 1, 'NORMAL_MS_SAMPLE_TEST:\n' );
  fprintf ( 1, '  NORMAL_MS_SAMPLE samples the Normal MS distribution.\n' );

  mu = 100.0;
  sigma = 15.0;
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter MU =    %14f\n', mu );
  fprintf ( 1, '  PDF parameter SIGMA = %14f\n', sigma );

  fprintf ( 1, '\n' );
  for i = 1 : 10
    [ x, seed ] = normal_ms_sample ( mu, sigma, seed );
    fprintf ( 1, ' %4d  %14g\n', i, x );
  end

  return
end
