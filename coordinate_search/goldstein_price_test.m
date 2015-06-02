function goldstein_price_test ( )

%*****************************************************************************80
%
%% GOLDSTEIN_PRICE_TEST works with the Goldstein-Price function.
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
%    Zbigniew Michalewicz,
%    Genetic Algorithms + Data Structures = Evolution Programs,
%    Third Edition,
%    Springer Verlag, 1996,
%    ISBN: 3-540-60676-9,
%    LC: QA76.618.M53.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GOLDSTEIN_PRICE_TEST:\n' );
  fprintf ( 1, '  Test COORDINATE_SEARCH with the Goldstein-Price function.\n' );
  n = 2;

  x = [ -0.5, 0.25 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', goldstein_price ( x ) );

  flag = 0;
  x = coordinate_search ( x, @goldstein_price, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', goldstein_price ( x ) );
%
%  Repeat with more difficult start.
%
  x = [ -4.0, 5.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', goldstein_price ( x ) );

  flag = 0;
  x = coordinate_search ( x, @goldstein_price, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', goldstein_price ( x ) );
%
%  Demonstrate correct minimizer.
%
  x = [ 0.0, -1.0 ];
  r8vec_print ( n, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', goldstein_price ( x ) );

  return
end
