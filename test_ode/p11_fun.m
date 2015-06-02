function yp = p11_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P11_FUN evaluates the function for problem P11.
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

  yp(1)        =             - y(1);
  yp(2:neqn-1) = y(1:neqn-2) - y(2:neqn-1);
  yp(neqn)     = y(neqn-1);

  return
end
