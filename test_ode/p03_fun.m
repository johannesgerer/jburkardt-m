function yp = p03_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P03_FUN evaluates the function for problem P03.
%
%  Discussion:
%
%    y' = cos(t) * y
%    y(0) = 1
%
%    1 equation.
%    Enright and Pryce nonstiff problem #A3.
%    Not autonomous.
%
%    Exact solution:
%
%      y(t) = exp ( sin ( t ) )
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

  yp(1) = y(1) * cos ( t );

  return
end
