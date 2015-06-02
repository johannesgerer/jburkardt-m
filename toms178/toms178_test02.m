function toms178_test02 ( )

%*****************************************************************************80
%
%% TOMS178_TEST02 tests HOOKE with the WOODS function.
%
%  Discussion:
%
%    The Hooke and Jeeves algorithm works well when RHO = 0.5, but
%    does poorly when RHO = 0.6, and better when RHO = 0.8
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2008
%
%  Author:
%
%    John Burkardt
%
  nvars = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS178_TEST02\n' );
  fprintf ( 1, '  HOOKE seeks a minimizer of F(X).\n' );
  fprintf ( 1, '  Here we use the Woods function.\n' );
%
%  Starting guess.
%
  startpt(1) = -3.0;
  startpt(2) = -1.0;
  startpt(3) = -3.0;
  startpt(4) = -1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Initial estimate X =\n' );
  fprintf ( 1, '\n' );
  for i = 1 : nvars
    fprintf ( 1, '  %8d  %e\n', i, startpt(i) );
  end

  value = woods ( startpt, nvars );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X) = %e\n', value );
%
%  Call HOOKE.
%
  itermax = 5000;
  rho = 0.5;
  eps = 1.0E-06;

  [ it, endpt ] = hooke ( nvars, startpt, rho, eps, itermax, @woods );
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

  value = woods ( endpt, nvars );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %e\n', value );

  return
end
