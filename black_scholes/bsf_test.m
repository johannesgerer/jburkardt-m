function bsf_test ( )

%*****************************************************************************80
%
%% BSF_TEST tests BSF.
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
  fprintf ( 1, 'BSF_TEST:\n' );
  fprintf ( 1, '  A demonstration of the Black-Scholes formula\n' );
  fprintf ( 1, '  for option valuation.\n' );

  s0 = 2.0;
  t0 = 0.0;
  e = 1.0;
  r = 0.05;
  sigma = 0.25;
  t1 = 3.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The asset price at time T0, S0    = %f\n', s0 );
  fprintf ( 1, '  The time                    T0    = %f\n', t0 );
  fprintf ( 1, '  The exercise price          E     = %f\n', e );
  fprintf ( 1, '  The interest rate           R     = %f\n', r );
  fprintf ( 1, '  The asset volatility        SIGMA = %f\n', sigma );
  fprintf ( 1, '  The expiry date             T1    = %f\n', t1 );

  c = bsf ( s0, t0, e, r, sigma, t1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The option value C = %f\n', c );

  return
end
