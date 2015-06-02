function mckinnon_test ( )

%*****************************************************************************80
%
%% MCKINNON_TEST works with the McKinnon function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 January 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Michael McKinnon,
%    An Iterative Method for Finding Stationary Values of a Function
%    of Several Variables,
%    Computer Journal,
%    Volume 5, 1962, pages 147-151.
%
  global phi
  global tau
  global theta

  fprintf ( 1, '\n' );
  fprintf ( 1, 'MCKINNON_TEST:\n' );
  fprintf ( 1, '  Test COORDINATE_SEARCH with the McKinnon function.\n' );
  n = 2;
%
%  Test 1
%
  a = ( 1.0 + sqrt ( 33.0 ) ) / 8.0;
  b = ( 1.0 - sqrt ( 33.0 ) ) / 8.0;

  phi = 10.0;
  tau = 1.0;
  theta = 15.0;

  x = [ a, b ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '  PHI = %f, TAU = %f, THETA = %f\n', phi, tau, theta );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', mckinnon ( x ) );

  flag = 0;
  x = coordinate_search ( x, @mckinnon, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', mckinnon ( x ) );

  x = [ 0.0, -0.5 ];
  r8vec_print ( n, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', mckinnon ( x ) );
%
%  Test 2
%
  a = ( 1.0 + sqrt ( 33.0 ) ) / 8.0;
  b = ( 1.0 - sqrt ( 33.0 ) ) / 8.0;

  phi = 60.0;
  tau = 2.0;
  theta = 6.0;

  x = [ a, b ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '  PHI = %f, TAU = %f, THETA = %f\n', phi, tau, theta );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', mckinnon ( x ) );

  flag = 0;
  x = coordinate_search ( x, @mckinnon, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', mckinnon ( x ) );

  x = [ 0.0, -0.5 ];
  r8vec_print ( n, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', mckinnon ( x ) );
%
%  Test 3
%
  a = ( 1.0 + sqrt ( 33.0 ) ) / 8.0;
  b = ( 1.0 - sqrt ( 33.0 ) ) / 8.0;

  phi = 4000.0;
  tau = 3.0;
  theta = 6.0;

  x = [ a, b ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '  PHI = %f, TAU = %f, THETA = %f\n', phi, tau, theta );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', mckinnon ( x ) );

  flag = 0;
  x = coordinate_search ( x, @mckinnon, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', mckinnon ( x ) );

  x = [ 0.0, -0.5 ];
  r8vec_print ( n, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', mckinnon ( x ) );
  return
end
