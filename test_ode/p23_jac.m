function jac = p23_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P23_JAC evaluates the jacobian for problem p23.
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

  jac(1,1) = 0.0;
  jac(1,2) = 1.0;

  jac(2,1) = 0.5 * y(1).^2 - 1.0;
  jac(2,2) = 0.0;

  return
end
