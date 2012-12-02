function jac = p07_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P07_JAC evaluates the jacobian for problem 7.
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

  for i = 1 : nvar - 1
    jac(i,i) = 100.0 * ( 1.0 - x(i) * x(i) ) ...
      / ( 1.0 + x(i) + x(i) * x(i) )^2;
  end

  jac(1,1) = jac(1,1) + 2.0;
  jac(1,2) = jac(1,2) - 1.0;
  jac(1,nvar) = jac(1,nvar) - 1.0;

  for i = 2 : nvar-2
    jac(i,i-1) = jac(i,i-1) - 1.0;
    jac(i,i) = jac(i,i) + 3.0;
    jac(i,i+1) = jac(i,i+1) - 1.0;
    jac(i,nvar) = jac(i,nvar) - 1.0;
  end

  jac(nvar-1,nvar-2) = jac(nvar-1,nvar-2) - 1.0;
  jac(nvar-1,nvar-1) = jac(nvar-1,nvar-1) + 2.0;
  jac(nvar-1,nvar) = jac(nvar-1,nvar) - 1.0;

  return
end
