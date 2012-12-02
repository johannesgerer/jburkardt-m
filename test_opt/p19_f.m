function f = p19_f ( n, x )

%*****************************************************************************80
%
%% P19_F evaluates the objective function for problem 19.
%
%  Discussion:
%
%    The function is similar to Rosenbrock's.  The "valley" follows
%    the curve X(2) = X(1)^3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 March 2000
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
%    A Leon,
%    A Comparison of Eight Known Optimizing Procedures,
%    in Recent Advances in Optimization Techniques,
%    edited by Abraham Lavi, Thomas Vogl,
%    Wiley, 1966.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  f1 = x(2) - x(1) * x(1) * x(1);
  f2 = 1.0 - x(1);

  f = 100.0 * f1 * f1 + f2 * f2;

  return
end
