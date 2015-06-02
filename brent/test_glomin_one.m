function test_glomin_one ( a, b, c, m, machep, e, t, f, title )

%*****************************************************************************80
%
%% TEST_GLOMIN_ONE tests the Brent global minimizer on one test function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the interval.
%
%    Input, real C, an initial guess for the global
%    minimizer.  If no good guess is known, C = A or B is acceptable.
%
%    Input, real M, the bound on the second derivative.
%
%    Input, real MACHEP, an estimate for the relative machine
%    precision.
%
%    Input, real E, a positive tolerance, a bound for the
%    absolute error in the evaluation of F(X) for any X in [A,B].
%
%    Input, real T, a positive absolute error tolerance.
%
%    Input, function value = F ( X ), the name of a user-supplied
%    function whose global minimum is being sought.
%
%    Input, string TITLE, a title for the problem.
%
  [ x, fx ] = glomin ( a, b, c, m, machep, e, t, f );
  fa = f ( a );
  fb = f ( b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A                 X             B\n' );
  fprintf ( 1, '    F(A)              F(X)          F(B)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %14f  %14f  %14f\n', a,  x,  b );
  fprintf ( 1, '  %14e  %14e  %14e\n', fa, fx, fb );

  return
end
