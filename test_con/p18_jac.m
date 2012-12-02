function jac = p18_jac ( option, nvar, u )

%*****************************************************************************80
%
%% P18_JAC evaluates the jacobian for problem 18.
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

  a = 0.0;
  b = 0.01;
  ua = 0.0;
  ub = 25.0;

  lambda = u(nvar);
  m = nvar - 1;
  h = 1.0 / ( m - 1 );

  jac(1,1) = 1.0;
  jac(1,nvar) = - ua;

  for i = 2 : m - 1

    t = ( ( m - i ) * a + ( i - 1 ) * b ) / ( m - 1 );

    jac(i,i-1) = 0.5 / h;
    jac(i,i) = - 1.0 / h - p18_gpu ( u(i), lambda );
    jac(i,i+1) = 0.5 / h;
    jac(i,nvar) = - p18_gpl ( t, u(i), lambda );

  end

  jac(m,m) = 1.0;
  jac(m,nvar) = - ub;

  return
end
