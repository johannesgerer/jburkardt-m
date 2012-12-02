function test_local_min_one ( a, b, eps, t, f, title )

%*****************************************************************************80
%
%% TEST_LOCAL_MIN_ONE tests the Brent local minimizer on one test function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the interval.
%
%    Input, real EPS, a positive relative error tolerance.
%
%    Input, real T, a positive absolute error tolerance.
%
%    Input, real value F ( x ), the name of a user-supplied
%    function whose local minimum is being sought.
%
%    Input, string TITLE, a title for the problem.
%
  [ x, fx ] = local_min ( a, b, eps, t, f );
  fa = f ( a );
  fb = f ( b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A                 X             B\n' );
  fprintf ( 1, '    F(A)              F(X)          F(B)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %14f  %14f  %14f\n',  a,  x,  b );
  fprintf ( 1, '  %14e  %14e  %14e\n', fa, fx, fb );

  return
end
