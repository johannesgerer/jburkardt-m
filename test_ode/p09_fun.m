function yp = p09_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P09_FUN evaluates the function for problem P09.
%
%  Discussion:
%
%    y1' =  ( - y2 - y1 * y3 ) / sqrt ( y1^2 + y2^2 )
%    y2' =  (   y1 - y2 * y3 ) / sqrt ( y1^2 + y2^2 )
%    y3' =      y1             / sqrt ( y1^2 + y2^2 )
%    y1(0) = 3
%    y2(0) = 0
%    y3(0) = 0
%
%    3 equations.
%    Enright and Pryce nonstiff problem #B4.
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

  norm = sqrt ( y(1).^2 + y(2).^2 );

  if ( 0.0 < norm )
    yp(1) = - y(2) - y(1) * y(3) / norm;
    yp(2) =   y(1) - y(2) * y(3) / norm;
    yp(3) =                 y(1) / norm;
  else
    yp(1:3) = [ 0.0, 0.0, 0.0 ];
  end

  return
end
