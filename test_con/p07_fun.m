function fx = p07_fun ( option, nvar, x )

%*****************************************************************************80
%
%% P07_FUN evaluates the function for problem 7.
%
%  Title:
%
%    Cell kinetics problem.
%
%  Description:
%
%    The function is of the form
%
%      F(I) = Sum ( 1 <= J <= NVAR-1)
%        A(I,J) * X(J) + RHO ( X(I) ) - X(NVAR)
%
%    with tridiagonal matrix A.
%
%  Special points:
%
%    Limit points in the variable NVAR are sought.  There are two:
%
%       X(1)      X(2)      X(3)      X(4)      X(5)       X(6)
%
%    ( 1.048362, 1.048362, 1.048362, 1.048362, 1.048362, 34.35693 ).
%    ( 8.822219, 8.822219, 8.822219, 8.822219, 8.822218, 18.88707 ).
%
%    There are also four bifurcation points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Werner Rheinboldt,
%    Solution Fields of Nonlinear Equations and Continuation Methods,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 2, April 1980, pages 221-237.
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the function.
%
%    Output, real FX(NVAR-1), the value of the function at X.
%

%
%  RHO(X) = 100.0 * X / ( 1 + X + X**2 )
%
  for i = 1 : nvar - 1
    fx(i) = 100.0 * x(i) / ( 1.0 + x(i) + x(i) * x(i) ) - x(nvar);
  end
%
%  The tridiagonal matrix A = (  2 -1  0  0  0  0 ... )
%                             ( -1  2 -1  0  0  0 ... )
%                             (  0 -1  2 -1  0  0 ... )
%
  fx(1) = fx(1) + 2.0 * x(1) - x(2);
  for i = 2 : nvar - 2
    fx(i) = fx(i) - x(i-1) + 3.0 * x(i) - x(i+1);
  end
  fx(nvar-1) = fx(nvar-1) - x(nvar-2) + 2.0 * x(nvar-1);

  return
end
