function f = p04_f ( n, x )

%*****************************************************************************80
%
%% P04_F evaluates the objective function for problem 4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Richard Brent,
%    Algorithms for Minimization with Derivatives,
%    Dover, 2002,
%    ISBN: 0-486-41998-3,
%    LC: QA402.5.B74.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f1 = 10000.0 * x(1) * x(2) - 1.0;
  f2 = exp ( - x(1) ) + exp ( - x(2) ) - 1.0001;

  f = f1 * f1 + f2 * f2;

  return
end
