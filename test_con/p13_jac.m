function jac = p13_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P13_JAC evaluates the jacobian for problem 13.
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

  m = round ( sqrt ( nvar - 1) );
  lambda = x(nvar);

  jac = p13_jac2 ( option, m, nvar, lambda, x );

  return
end
