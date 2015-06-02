function jac = p31_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P31_JAC evaluates the jacobian for problem p31.
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

  a = p31_param ( 'GET', 'A', [] );
  b = p31_param ( 'GET', 'B', [] );
  c = p31_param ( 'GET', 'C', [] );
  d = p31_param ( 'GET', 'D', [] );

  jac(1,1) =  a - b * y(2);
  jac(1,2) =    - b * y(1);

  jac(2,1) = c * y(2);
  jac(2,2) = c * y(1) - d;

  return
end
