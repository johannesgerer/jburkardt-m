function jac = p15_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P15_JAC computes the jacobian for problem 15.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
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
%    Input, X(NVAR), the point where the jacobian is evaluated.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );
%
%  Get the coefficients of the linear part of the function.
%
  array = p15_gx ( );

  jac(1:nvar-1,1:nvar) = array(1:nvar-1,1:nvar);
%
%  Add the derivatives of the nonlinear part.
%
  jac(2,2) = jac(2,2) + 5.6D-08 * 25.0 * exp ( 25.0 * x(2) );

  jac(5,5) = jac(5,5) + 5.6D-08 * 25.0 * exp ( 25.0 * x(5) );

  u = 1962.0 * ( x(3) - x(1) );

  jac(6,1) = jac(6,1) + 7.65 * 1962.0 / ( 1.0 + u * u ) / 0.201;

  jac(6,3) = jac(6,3) - 7.65 * 1962.0 / ( 1.0 + u * u ) / 0.201;

  return
end
