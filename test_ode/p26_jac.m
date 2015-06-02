function jac = p26_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P26_JAC evaluates the jacobian for problem p26.
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

  a = p26_param ( 'GET', 'A', [] );

  jac(1,1) = 0.0;
  jac(1,2) = 1.0;

  jac(2,1) = - ( pi * pi + a * a );
  jac(2,2) = 2.0 * a;

  return
end
