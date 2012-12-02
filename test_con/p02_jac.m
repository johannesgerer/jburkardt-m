function jac = p02_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P02_JAC evaluates the jacobian for problem 2.
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
%    Input, real X(NVAR), the argument of the jacobian.
%
%    Output, real JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  jac(1,1) = 2.0 * x(1);
  jac(2,1) = 1.0;
  jac(1,2) = - 1.0;
  jac(2,2) = 0.5 * pi * sin ( 0.5 * pi * x(2) );
%
%  Get the starting point
%
  y = p02_start ( option, nvar );
%
%  Get the function value at the starting point
%
  gy = p02_gx ( y );

  jac(1,3) = gy(1);
  jac(2,3) = gy(2);

  return
end
