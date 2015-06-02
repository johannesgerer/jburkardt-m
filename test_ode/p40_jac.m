function jac = p40_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P40_JAC evaluates the jacobian for problem p40.
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

  e = p40_param ( 'GET', 'E', [] );

  jac(1,1) = ( 2.0 * y(1) - t ) / e;

  return
end
