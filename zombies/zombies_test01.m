function zombies_test01 ( )

%*****************************************************************************80
%
%% ZOMBIES_TEST01
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ZOMBIES_TEST01:\n' );
  fprintf ( 1, '  Demonstrate the basis model.\n' );

  alpha = 0.005;
  beta = 0.0095;
  zeta = 0.0001;
  delta = 0.0001;
  t = 10.0;
  dt = 0.01;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  ALPHA = %g, death rate of zombies in human/zombie encounter.\n', alpha );
  fprintf ( 1, '  BETA =  %g, infection rate for human/zombie encounter.\n', beta );
  fprintf ( 1, '  ZETA =  %g, dead-human-zombie-resurrection rate.\n', zeta );
  fprintf ( 1, '  DELTA = %g, Non-zombie-related human death rate.\n', delta );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  T =     %g, length of time period to be studied.\n', t );
  fprintf ( 1, '  DT =    %g, stepsize for Euler method.\n', dt );

  zombies ( alpha, beta, zeta, delta, t, dt );

  return
end
