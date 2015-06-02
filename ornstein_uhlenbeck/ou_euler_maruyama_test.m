function ou_euler_maruyama_test ( )

%*****************************************************************************80
%
%% OU_EULER_MARUYAMA_TEST tests OU_EULER_MARUYAMA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 January 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'OU_EULER_MARUYAMA_TEST:\n' );
  fprintf ( 1, '  Estimate a solution to the Ornstein-Uhlenbeck equation\n' );
  fprintf ( 1, '  using the Euler-Maruyama method for stochastic \n' );
  fprintf ( 1, '  differential equations.\n' );
  fprintf ( 1, '\n' );

  theta = 2.0;
  fprintf ( 1, '  Using decay rate THETA = %g\n', theta );
  mu = 1.0;
  fprintf ( 1, '  Using mean MU = %g\n', mu );
  sigma = 0.15;
  fprintf ( 1, '  Using variance SIGMA = %g\n', sigma );
  x0 = 2.0;
  fprintf ( 1, '  Using initial value X0 = %g\n', x0 );
  tmax = 3.0;
  fprintf ( 1, '  Using final time TMAX = %g\n', tmax );
  n = 10000;
  fprintf ( 1, '  Using number of large timesteps N = %d\n', n );
  r = 16;
  fprintf ( 1, '  Using R = %d small time steps per one large time step\n', r );
  seed = 123456789;
  fprintf ( 1, '  Using value of random SEED = %d\n', seed );

  ou_euler_maruyama ( theta, mu, sigma, x0, tmax, n, r, seed );

  return
end
