function powell_test ( )

%*****************************************************************************80
%
%% POWELL_TEST works with the Powell function.
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
%    Michael Powell,
%    An Iterative Method for Finding Stationary Values of a Function
%    of Several Variables,
%    Computer Journal,
%    Volume 5, 1962, pages 147-151.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'POWELL_TEST:\n' );
  fprintf ( 1, '  Test COORDINATE_SEARCH with the Powell function.\n' );
  n = 4;

  x = [ 3.0, -1.0, 0.0, 1.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', powell ( x ) );

  flag = 0;
  x = coordinate_search ( x, @powell, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', powell ( x ) );
%
%  Demonstrate correct minimizer.
%
  x = [ 0.0, 0.0, 0.0, 0.0 ];
  r8vec_print ( n, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', powell ( x ) );

  return
end
