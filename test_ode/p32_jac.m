function jac = p32_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P32_JAC evaluates the jacobian for problem p32.
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

  beta = p32_param ( 'GET', 'BETA', [] );
  rho = p32_param ( 'GET', 'RHO', [] );
  sigma = p32_param ( 'GET', 'SIGMA', [] );

  jac(1,1) = - sigma;
  jac(1,2) =   sigma;
  jac(1,3) =   0.0;

  jac(2,1) =   rho - y(3);
  jac(2,2) = - 1.0;
  jac(2,3) = - y(1);

  jac(3,1) =   y(2);
  jac(3,2) =   y(1);
  jac(3,3) =   - beta;

  return
end
