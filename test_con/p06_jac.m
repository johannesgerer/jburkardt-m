function jac = p06_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P06_JAC evaluates the jacobian for problem 6.
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
%  Set the jacobian to the linear coefficients.
%
  b(1:5,1:8) = p06_barray ( );

  jac(1:5,1:8) = b(1:5,1:8);
%
%  Add the nonlinear terms.
%
  c(1:5,1:8,1:8) = p06_carray ( );

  for i = 1 : 5
    for j = 1 : 8
      for k = 1 : 8
        jac(i,j) = jac(i,j) + ( c(i,j,k) + c(i,k,j) ) * x(k);
      end
    end
  end
%
%  Constraint equations.
%
  jac(6,6) = 1.0;
  jac(7,8) = 1.0;

  return
end
