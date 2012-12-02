function forward_test ( )

%*****************************************************************************80
%
%% FORWARD_TEST tests FORWARD.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FORWARD_TEST:\n' );
  fprintf ( 1, '  A demonstration of the forward difference method\n' );
  fprintf ( 1, '  for option valuation.\n' );

  e = 4.0;
  r = 0.03;
  sigma = 0.50;
  t1 = 1.0;
  nx = 11;
  nt = 29;
  smax = 10.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The exercise price        E =     %g\n', e );
  fprintf ( 1, '  The interest rate         R =     %g\n', r );
  fprintf ( 1, '  The asset volatility      SIGMA = %g\n', sigma );
  fprintf ( 1, '  The expiry date           T1 =    %g\n', t1 );
  fprintf ( 1, '  The number of space steps NX =    %d\n', nx );
  fprintf ( 1, '  The number of time steps  NT =    %d\n', nt );
  fprintf ( 1, '  The value of              SMAX =  %g\n', smax );

  u = forward ( e, r, sigma, t1, nx, nt, smax );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial   Option\n' );
  fprintf ( 1, '  Value     Value\n' );     
  fprintf ( 1, '\n' );

  smin = 0.0;
  for i = 1 : nx - 1 
    s = ( ( nx - i - 1 ) * smin + i * smax ) / ( nx - 1 );
    fprintf ( 1, '  %f  %f\n', s, u(i,nt+1) );
  end
%
%  Plot.
%
  figure ( 2 )
  waterfall ( u' );
  title ( 'Cost versus time step, using forward difference method' );
  xlabel ( 'Cost' );
  ylabel ( 'Time step' );

  return
end
