function yp = p34_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P34_FUN evaluates the function for problem P34.
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

  g = p34_param ( 'GET', 'G' );
  k = p34_param ( 'GET', 'K' );
  l = p34_param ( 'GET', 'L' );
  m = p34_param ( 'GET', 'M' );
  yp(1) = y(2);
  yp(2) = - ( g / l ) * y(1) - ( k / m ) * y(2);

  return
end
