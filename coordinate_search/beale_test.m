function beale_test ( )

%*****************************************************************************80
%
%% BEALE_TEST works with the Beale function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Evelyn Beale,
%    On an Iterative Method for Finding a Local Minimum of a Function
%    of More than One Variable,
%    Technical Report 25, 
%    Statistical Techniques Research Group,
%    Princeton University, 1958.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BEALE_TEST:\n' );
  fprintf ( 1, '  Test COORDINATE_SEARCH with the Beale function.\n' );
  n = 2;

  x = [ 1.0, 1.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', beale ( x ) );

  flag = 0;
  x = coordinate_search ( x, @beale, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', beale ( x ) );
%
%  Repeat with more difficult start.
%
  x = [ 1.0, 4.0 ];
  r8vec_print ( n, x, '  Initial point X0:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X0) = %g\n', beale ( x ) );

  flag = 0;
  x = coordinate_search ( x, @beale, flag );
  r8vec_print ( n, x, '  Estimated minimizer X1:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X1) = %g\n', beale ( x ) );
%
%  Demonstrate correct minimizer.
%
  x = [ 3.0, 0.5 ];
  r8vec_print ( n, x, '  Correct minimizer X*:' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  F(X*) = %g\n', beale ( x ) );

  return
end
