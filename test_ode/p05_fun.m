function yp = p05_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P05_FUN evaluates the function for problem P05.
%
%  Discussion:
%
%    y' = (y-t)/(y+t)
%    y(0) = 4
%
%    1 equation.
%    Enright and Pryce nonstiff problem #A5.
%    Not autonomous.
%
%    Exact solution:
%
%      r = sqrt ( t + y(t)^2 )
%      theta = atan ( y(t) / t )
%
%      r = 4 * exp ( pi/2 - theta )
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

  yp(1) = ( y(1) - t ) / ( y(1) + t );

  return
end
