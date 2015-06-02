function yp = p29_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P29_FUN evaluates the function for problem P29.
%
%  Discussion:
%
%    1 equation
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

  if ( t <= 10.0 )
    yp(1) = - 2.0 / 21.0 ...
      - 120.0 * ( t - 5.0 ) / ( 1.0 + 4.0 * ( t - 5.0 )^2 );
  else
    yp(1) = - 2.0 * y(1);
  end

  return
end
