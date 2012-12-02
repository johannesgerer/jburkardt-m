function test_zero_one ( a, b, machep, t, f, title )

%*****************************************************************************80
%
%% TEST_ZERO_ONE tests the Brent zero finding routine on one test function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the two endpoints of the change of sign
%    interval.
%
%    Input, real MACHEP, an estimate for the relative machine
%    precision.
%
%    Input, real T, a positive error tolerance.
%
%    Input, function value = F ( x ), the name of a user-supplied
%    function which evaluates the function whose zero is being sought.
%
%    Input, string TITLE, a title for the problem.
%
  z = zero ( a, b, machep, t, f );
  fz = f ( z );
  fa = f ( a );
  fb = f ( b );

  fprintf ( 1, '\n' );
  fprintf ( 1, '%s\n', title );
  fprintf ( 1, '\n' );
  fprintf ( 1, '      A                 Z             B\n' );
  fprintf ( 1, '    F(A)              F(Z)          F(B)\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %14f  %14f  %14f\n', a,  z,  b );
  fprintf ( 1, '  %14e  %14e  %14e\n', fa, fz, fb );

  return
end
