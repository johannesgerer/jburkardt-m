function jac = p19_jac ( option, nvar, x )

%*****************************************************************************80
%
%% P19_JAC evaluates the jacobian for problem 19.
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

  press = 7.0;
  temper = 323.0;
%
%  Get chemical constants.
%
  [ con, flow ] = p19_con ( nvar, press, temper, x );
%
%  Get derivatives of chemical constants.
%
  [ dc4dx4, dc4dx5, dc5dx4, dc5dx5 ] = p19_conp ( con, nvar, temper, x );
%
%  Differentiate the Mole Balance equations:
%
  for i = 1 : 5
    jac(i,i) = x(11);
    jac(i,i+5) = x(12);
    jac(i,11) = x(i);
    jac(i,12) = x(i+5);
    jac(i,13) = - flow(i);
  end
%
%  Differentiate the Liquid-Vapor Transfer equations:
%
  for i = 6 : 10
    jac(i,i) = 1.0;
    jac(i,i-5) = - con(i-5);
  end

  jac(9,4) = jac(9,4) - dc4dx4 * x(4);
  jac(9,5) = jac(9,5) - dc4dx5 * x(5);

  jac(10,4) = jac(10,4) - dc5dx4 * x(4);
  jac(10,5) = jac(10,5) - dc5dx5 * x(5);
%
%  Differentiate the Liquid and Vapor Proportion equations:
%
  jac(11,1:5) = 1.0;
  jac(12,6:10) = 1.0;

  return
end
