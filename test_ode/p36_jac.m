function jac = p36_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P36_JAC evaluates the jacobian for problem p36.
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

  jac(1,1) =  0.0;
  jac(1,2) =  1.0;

  jac(2,1) = 1.0 - 3.0 * y(1).^2;
  jac(2,2) = 0.0;

  return
end
