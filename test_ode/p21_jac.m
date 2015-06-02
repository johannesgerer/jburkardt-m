function jac = p21_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P21_JAC evaluates the jacobian for problem p21.
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

  jac(2,1) = - 1.0 + 0.25 / ( t + 1.0 ).^2;
  jac(2,2) = - 1.0 / ( t + 1.0 );

  return
end
