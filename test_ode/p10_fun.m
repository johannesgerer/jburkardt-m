function yp = p10_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P10_FUN evaluates the function for problem P10.
%
%  Discussion:
%
%    y1' =   y2 * y3
%    y2' = - y1 * y3
%    y3' = - 0.51 * y1 * y2
%    y1(0) = 0
%    y2(0) = 1
%    y3(0) = 1
%
%    3 equations.
%    Enright and Pryce nonstiff problem #B5.
%    Autonomous.
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

  yp(1) =  y(2) * y(3);
  yp(2) = -y(1) * y(3);
  yp(3) = -0.51 * y(1) * y(2);

  return
end
