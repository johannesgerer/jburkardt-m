function jac = p04_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P04_JAC evaluates the jacobian for problem 4.
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

  E = 2.71828182845904523536;

  jac(1,1) = 0.5 * x(2) * cos ( x(1) * x(2) ) - 1.0;
  jac(2,1) = ( 4.0 * pi - 1.0 ) ...
    * 2.0 * exp ( 2.0 * x(1) ) ...
    / ( 4.0 * pi ) - 2.0 * E;
  jac(1,2) = 0.5 * x(1) * cos ( x(1) * x(2) ) - 1.0 / pi;
  jac(2,2) = E / pi;
%
%  Get the starting point
%
  y = p04_start ( option, nvar );
%
%  Get the function value at the starting point
%
  gy = p04_gx ( y );

  jac(1,3) = gy(1);
  jac(2,3) = gy(2);

  return
end
