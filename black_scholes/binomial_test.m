function binomial_test ( )

%*****************************************************************************80
%
%% BINOMIAL_TEST tests BINOMIAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BINOMIAL_TEST:\n' );
  fprintf ( 1, '  A demonstration of the binomial method\n' );
  fprintf ( 1, '  for option valuation.\n' );

  s0 = 2.0;
  e = 1.0;
  r = 0.05;
  sigma = 0.25;
  t1 = 3.0;
  m = 256;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The asset price at time 0, S0    = %f\n', s0 );
  fprintf ( 1, '  The exercise price         E     = %f\n', e );
  fprintf ( 1, '  The interest rate          R     = %f\n', r );
  fprintf ( 1, '  The asset volatility       SIGMA = %f\n', sigma );
  fprintf ( 1, '  The expiry date            T1    = %f\n', t1 );
  fprintf ( 1, '  The number of intervals    M     = %d\n', m );

  c = binomial ( s0, e, r, sigma, t1, m );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The option value is %f\n', c );

  return
end
