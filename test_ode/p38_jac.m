function jac = p38_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P38_JAC evaluates the jacobian for problem p38.
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
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Input, real T, Y(NEQN), the arguments of the jacobian.
%
%    Output, real JAC(NEQN,NEQN), the jacobian matrix.
%
  jac(1,1) =  y(1) * ( 2.0 - 3.0 * y(1) );

  return
end
