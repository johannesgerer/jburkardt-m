function jac = p16_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P16_JAC computes the jacobian for problem 16.
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

  beta = 0.4;
  gamma = 20.0;

  lambda = x(nvar);
  m = nvar - 1;
  h = 1.0 / ( m - 1  );

  for i = 1 : m

    s = h * ( i - 1 );
    trapezoid = 0.0;

    for j = 1 : m

      t = h * ( j - 1 );

      arg = beta * gamma * ( 1.0 - x(j) ) / ( 1.0 + beta * ( 1.0 - x(j) ) );

      if ( j == 1 )
        factor = 0.5;
      elseif ( j < m - 1 )
        factor = 1.0;
      elseif ( j == m )
        factor = 0.5;
      end

      trapezoid = trapezoid + h * factor * x(j) * exp ( arg ) * ...
        ( max ( s, t ) - 1.0 );

      dg = - beta * gamma / ( 1.0 + beta * ( 1.0 - x(j) ) )^2;

      jac(i,j) = jac(i,j) - lambda * h * factor * exp ( arg ) * ...
        ( 1.0 + x(j) * dg ) * ( max ( s, t ) - 1.0 );

    end

    jac(i,i) = jac(i,i) + 1.0;

    jac(i,nvar) = - trapezoid;

  end

  return
end
