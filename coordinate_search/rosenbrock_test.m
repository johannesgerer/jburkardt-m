function rosenbrock_test ( )

%*****************************************************************************80
%
%% ROSENBROCK_TEST works with the Rosenbrock function.
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
%    Howard Rosenbrock,
%    An Automatic Method for Finding the Greatest or Least Value of a Function,
%    Computer Journal,
%    Volume 3, 1960, pages 175-184.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ROSENBROCK_TEST:\n' );
  fprintf ( 1, '  Test COORDINATE_SEARCH with the Rosenbrock function.\n' );
  n = 2;

  x = [ - 1.2, 1.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', rosenbrock ( x ) );

  flag = 0;
  x = coordinate_search ( x, @rosenbrock, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', rosenbrock ( x ) );
%
%  Demonstrate correct minimizer.
%
  x = [ 1.0, 1.0 ];
  r8vec_print ( n, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', rosenbrock ( x ) );

  return
end
