function f = p17_f ( n, x )

%*****************************************************************************80
%
%% P17_F evaluates the objective function for problem 17.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2008
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
  f1 = x(2) - x(1) * x(1);
  f2 = 1.0 - x(1);
  f3 = x(4) - x(3) * x(3);
  f4 = 1.0 - x(3);
  f5 = x(2) + x(4) - 2.0;
  f6 = x(2) - x(4);

  f = 100.0 * f1 * f1 ...
    +         f2 * f2 ...
    +  90.0 * f3 * f3 ...
    +         f4 * f4 ...
    +  10.0 * f5 * f5 ...
    +   0.1 * f6 * f6;

  return
end
