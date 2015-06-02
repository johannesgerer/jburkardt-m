function jac = p04_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P04_JAC evaluates the jacobian for problem p04.
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
  jac(1,1) = ( 10.0 - y(1) ) / 40.0;

  return
end
