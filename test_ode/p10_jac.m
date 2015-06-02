function jac = p10_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P10_JAC evaluates the jacobian for problem p10.
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

  jac(1,1) =  0.00;
  jac(1,2) =  y(3);
  jac(1,3) =  y(2);
  jac(2,1) = -y(3);
  jac(2,2) =  0.00;
  jac(2,3) = -y(1);
  jac(3,1) = -0.51 * y(2);
  jac(3,2) = -0.51 * y(1);
  jac(3,3) =  0.00;

  return
end
