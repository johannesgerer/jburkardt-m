function yp = p04_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P04_FUN evaluates the function for problem P04.
%
%  Discussion:
%
%    y' = y*(20-y)/80
%    y(0) = 1
%
%    1 equation.
%    Enright and Pryce nonstiff problem #A4.
%    Autonomous.
%
%    Exact solution:
%
%      y(t) = 20 / ( 1 + 19 * exp ( -t / 4 ) )
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

  yp(1) = ( 1.0 - y(1) / 20.0 ) * y(1) / 4.0;

  return
end
