function jac = p20_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P20_JAC evaluates the jacobian for problem 20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real X(NVAR), the argument of the jacobian.
%
%    Output, real JAC(NVAR,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  l      = x(1);
  theta  = x(2);
  lambda = x(3);
  mu     = x(4);

  jac(1,1) = 2.0;
  jac(1,2) = - 2.0 * lambda * sin ( theta ) + mu * cos ( theta );
  jac(1,3) = 2.0 * cos ( theta );
  jac(1,4) = sin ( theta );

  jac(2,1) = - 2.0 * lambda * sin ( theta ) + mu * cos ( theta );
  jac(2,2) = 0.5 - 2.0 * lambda * l * cos ( theta ) - mu * l * sin ( theta );
  jac(2,3) = - 2.0 * l * sin ( theta );
  jac(2,4) = l * cos ( theta );

  hold_index = p20_i4_get ( 'hold_index' );

  jac(3,hold_index) = 1.0;

  return
end
