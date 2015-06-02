function jac = p09_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P09_JAC evaluates the jacobian for problem p09.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2013
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
  norm = sqrt ( y(1).^2 + y(2).^2 );
  norm3 = norm.^3;

  jac(1,1) = - y(3) * y(2).^2 / norm3;
  jac(1,2) = - 1.0 + y(1) * y(2) * y(3) / norm3;
  jac(1,3) = - y(1) / norm;

  jac(2,1) = 1.0 + y(1) * y(2) * y(3) / norm3;
  jac(2,2) = - y(1).^2 * y(3) / norm3;
  jac(2,3) = - y(2) / norm;

  jac(3,1) =   y(2).^2 / norm3;
  jac(3,2) = - y(1) * y(2) / norm3;
  jac(3,3) = 0.0;

  return
end
