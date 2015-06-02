function yp = p23_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P23_FUN evaluates the function for problem P23.
%
%  Discussion:
%
%    2 equations.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2013
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

  yp(1) = y(2);
  yp(2) = y(1).^3 / 6.0 - y(1) + 2.0 * sin ( 2.78535 * t );

  return
end
