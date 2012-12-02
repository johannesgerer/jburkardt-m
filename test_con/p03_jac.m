function jac = p03_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P03_JAC evaluates the jacobian for problem 3.
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
%
%  Get the starting point.
%
  y = p03_start ( option, nvar );
%
%  Get the (underlying) function value at the starting point.
%
  gy = p03_gx ( y );
%
%  The last column of the jacobian depends on the (underlying) function
%  value at the starting point.
%
  jac(1,1) = 10000.0 * x(2);
  jac(1,2) = 10000.0 * x(1);
  jac(1,3) = gy(1);

  jac(2,1) = - exp ( - x(1) );
  jac(2,2) = - exp ( - x(2) );
  jac(2,3) = gy(2);

  return
end
