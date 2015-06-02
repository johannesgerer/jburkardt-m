function yp = p13_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P13_FUN evaluates the function for problem P13.
%
%  Discussion:
%
%    10 equations.
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

  yp(1)        =             - 2.0 * y(1) + y(2);
  yp(2:neqn-1) = y(1:neqn-2) - 2.0 * y(2:neqn-1) + y(3:neqn);
  yp(neqn)     = y(neqn-1)   - 2.0 * y(neqn);

  return
end
