function normal_ms_cdf_test ( )

%*****************************************************************************80
%
%% NORMAL_MS_CDF_TEST tests NORMAL_MS_CDF.
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
  fprintf ( 1, 'NORMAL_MS_CDF_TEST\n' );
  fprintf ( 1, '  NORMAL_MS_CDF evaluates the CDF\n' );
  fprintf ( 1, '  for the Normal MS distribution.\n' );

  mu = 100.0;
  sigma = 15.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  PDF parameter MU =    %14f\n', mu );
  fprintf ( 1, '  PDF parameter SIGMA = %14f\n', sigma );

  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, '       X            CDF\n' );
  fprintf ( 1, '\n' );

  for i = -20 : 20
    x = mu + sigma * i / 10.0;
    cdf = normal_ms_cdf ( x, mu, sigma );
    fprintf ( 1, '  %14g  %14g\n', x, cdf );
  end

  return
end
