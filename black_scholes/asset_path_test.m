function asset_path_test ( )

%*****************************************************************************80
%
%% ASSET_PATH_TEST tests ASSET_PATH.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASSET_PATH_TEST:\n' );
  fprintf ( 1, '  Demonstrate the simulated of an asset price path.\n' );

  s0 = 2.0;
  mu = 0.1;
  sigma = 0.3;
  n = 100;
  t0 = 0.0;
  t1 = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The asset price at time 0,     S0    = %f\n', s0 );
  fprintf ( 1, '  The asset expected growth rate MU    = %f\n', mu );
  fprintf ( 1, '  The asset volatility           SIGMA = %f\n', sigma );
  fprintf ( 1, '  The expiry date                T1    = %f\n', t1 );
  fprintf ( 1, '  The number of time steps       N     = %d\n', n );

  s = asset_path ( s0, mu, sigma, t1, n );
%
%  Plot.
%
  figure ( 1 )
  t = ( linspace ( t0, t1, n + 1 ) )';
  plot ( t, s )
  grid on
  xlabel ( '<-- Time -->' )
  ylabel ( '<-- Value --> ' )
  title ( 'Simulated asset path' )
%
%  Print a little.
%
  r8vec_print_part ( n + 1, s, 10, '  Partial results:' );
%
%  Write to a file.
%
  output_filename = 'asset_path.txt';

  r8vec_write ( output_filename, n + 1, s );
 
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Full results written to "%s".\n', output_filename );

  return
end
