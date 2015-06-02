function yp = p32_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P32_FUN evaluates the function for problem P32.
%
%  Discussion:
%
%    3 equations.
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

  beta = p32_param ( 'GET', 'BETA' );
  rho = p32_param ( 'GET', 'RHO' );
  sigma = p32_param ( 'GET', 'SIGMA' );
  yp(1) = sigma * ( y(2) - y(1) );
  yp(2) = rho * y(1) - y(2) - y(1) * y(3);
  yp(3) = - beta * y(3) + y(1) * y(2);

  return
end
