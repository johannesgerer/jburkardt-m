function yp = p02_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P02_FUN evaluates the function for problem P02.
%
%  Discussion:
%
%    y' = -(y^3)/2
%    y(0) = 1
%
%    1 equation.
%    Enright and Pryce nonstiff problem #A2.
%    Autonomous.
%
%    Exact solution:
%
%      y(t) = 1 / sqrt ( t + 1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Wayne Enright, John Pryce,
%    Algorithm 648,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 1, pages 28-34.
%
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Input, real T, Y(NEQN), the arguments of the derivative
%    function.
%
%    Output, real YP(NEQN), the value of the derivative function.
%
  yp = zeros ( neqn, 1 );

  yp(1) = - 0.5 * y(1) * y(1) * y(1);

  return
end
