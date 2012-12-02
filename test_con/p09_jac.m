function jac = p09_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P09_JAC evaluates the jacobian for problem 9.
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

  [ height, ival, val ] = p09_gx ( option );

  x1 = x(1);
  x2 = x(2);
  x3 = x(3);
  x4 = x(4);

  jac(1,1) = 3.0 * x1 * x1 - 6.0 * height * x1 + 2.0 * height * height + x2 * x2;
  jac(1,2) = 2.0 * x1 * x2 - 2.0 * height * x2;
  jac(1,3) = - cos ( x4 );
  jac(1,4) = x3 * sin ( x4 );

  jac(2,1) = 2.0 * x1 * x2 - 2.0 * height * x2;
  jac(2,2) = x1 * x1 - 2.0 * height * x1 + 3.0 * x2 * x2 + 2.0;
  jac(2,3) = - sin ( x4 );
  jac(2,4) = - x3 * cos ( x4 );

  jac(3,1) = 0.0;
  jac(3,2) = 0.0;
  jac(3,3) = 0.0;
  jac(3,4) = 0.0;

  jac(3,ival) = 1.0;

  return
end
