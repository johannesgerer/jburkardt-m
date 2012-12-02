function jac = p05_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P05_JAC evaluates the jacobian for problem 5.
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
%    Output, real  JAC(NVAR-1,NVAR), the jacobian matrix evaluated
%    at X.  The NVAR-th row is not set by this routine.
%
  jac = zeros ( nvar, nvar );

  E = 2.71828182845904523536;

  if ( option == 1 )
    aval = 0.1;
  elseif ( option == 2 )
    aval = 0.5;
  else
    aval = 1.0;
  end

  jac(1,1) = 1.0 - aval * x(4);
  jac(1,2) = - x(4) * exp ( - x(2) ) / 3.0;
  jac(1,3) = 0.0;
  jac(1,4) = - aval * x(1) + exp ( - x(2) ) / 3.0 ...
           + ( aval - 1.0 - 1.0 / ( 3.0 * E ) );

  jac(2,1) = 0.0;
  jac(2,2) = 1.0 - aval * x(4);
  jac(2,3) = - 2.0 * x(3) * x(4) / ( 5.0 * ( 1.0 + x(3) * x(3) ) );
  jac(2,4) = - aval * x(2) - log ( 1.0 + x(3) * x(3) ) / 5.0 ...
           + ( aval - 1.0 - log ( 2.0 ) / 5.0 );

  jac(3,1) = x(4) * cos ( x(1) );
  jac(3,2) = 0.0;
  jac(3,3) = 1.0 - 2.0 * aval * x(3);
  jac(3,4) = sin ( x(1) ) + ( aval - 1.0 - sin ( 1.0 ) );

  return
end
