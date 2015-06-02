function yp = p27_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P27_FUN evaluates the function for problem P27.
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

  if ( mod ( floor ( t ), 2 ) == 0 )
    yp(1) = 55.0 - 1.5 * y(1);
  else
    yp(1) = 55.0 - 0.5 * y(1);
  end

  return
end
