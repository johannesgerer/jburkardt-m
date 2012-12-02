function toms178_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests HOOKE with the Rosenbrock function.
%
%  Modified:
%
%    12 February 2008
%
%  Author:
%
%    John Burkardt
%
  nvars = 2;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  HOOKE seeks a minimizer of F(X).\n' );
  fprintf ( 1, '  Here we use the Rosenbrock function.\n' );
%
%  Starting guess for Rosenbrock.
%
  startpt(1) = -1.2;
  startpt(2) = 1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial estimate X =\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nvars
    fprintf ( 1, '  %8d  %e\n', i, startpt(i) );
  end

  value = rosenbrock ( startpt, nvars );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X) = %e\n', value );
%
%  Call HOOKE.
%
  itermax = 5000;
  rho = 0.5;
  eps = 1.0E-06;

  [ it, endpt ] = hooke ( nvars, startpt, rho, eps, itermax, @rosenbrock );
%
%  Results.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of iterations taken = %d\n', it );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X* = \n' );
  fprintf ( 1, '\n' );
  for i = 1 : nvars
    fprintf ( 1, '  %8d  %e\n', i, endpt(i) );
  end

  value = rosenbrock ( endpt, nvars );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %e\n', value );

  return
end
