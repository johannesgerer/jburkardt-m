function f = p16_f ( n, x )

%*****************************************************************************80
%
%% P16_F evaluates the objective function for problem 16.
%
%  Discussion:
%
%    This function has a valley approaching the line X(2) = 1.
%
%    The function has a global minimizer:
%
%      X(*) = ( 3.0, 0.5 ), F(X*) = 0.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 January 2008
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
  f1 = 1.5   - x(1) * ( 1.0 - x(2)    );
  f2 = 2.25  - x(1) * ( 1.0 - x(2) * x(2) );
  f3 = 2.625 - x(1) * ( 1.0 - x(2) * x(2) * x(2) );

  f = f1 * f1 + f2 * f2 + f3 * f3;

  return
end
