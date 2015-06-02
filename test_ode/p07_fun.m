function yp = p07_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P07_FUN evaluates the function for problem P07.
%
%  Discussion:
%
%    y1' = -y1 +   y2
%    y2' =  y1 - 2 y2 + y3
%    y3' =         y2 - y3
%    y1(0) = 2
%    y2(0) = 0
%    y3(0) = 1
%
%    3 equations.
%    Enright and Pryce nonstiff problem #B2.
%    Autonomous.
%
%    Note that the quantity (y1+y2+y3) is conserved by the exact solution.
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

  yp(1) = - y(1) +       y(2);
  yp(2) =   y(1) - 2.0 * y(2) + y(3);
  yp(3) =                y(2) - y(3);

  return
end
