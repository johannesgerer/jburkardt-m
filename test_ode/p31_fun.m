function yp = p31_fun ( neqn, t, y )

%*****************************************************************************80
%
%% P31_FUN evaluates the function for problem P31.
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

  a = p31_param ( 'GET', 'A' );
  b = p31_param ( 'GET', 'B' );
  c = p31_param ( 'GET', 'C' );
  d = p31_param ( 'GET', 'D' );
  yp(1) = ( a - b * y(2) ) * y(1);
  yp(2) = ( c * y(1) - d ) * y(2);

  return
end
