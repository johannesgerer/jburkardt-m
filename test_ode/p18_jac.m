function jac = p18_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P18_JAC evaluates the jacobian for problem p18.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Input, real T, Y(NEQN), the arguments of the jacobian.
%
%    Output, real JAC(NEQN,NEQN), the jacobian matrix.
%
  jac = zeros ( neqn, neqn );

  d = ( sqrt ( ( y(1).^2 + y(2).^2 ) ) ).^5;

  jac(1,3) = 1.0;
  jac(2,4) = 1.0;
  jac(3,1) = ( 2.0 * y(1).^2 - y(2).^2 ) / d;
  jac(3,2) = 3.0 * y(1) * y(2) / d;
  jac(4,1) = 3.0 * y(1) * y(2) / d;
  jac(4,2) = ( - y(1).^2 + 2.0 * y(2).^2 ) / d;

  return
end
