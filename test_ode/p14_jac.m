function jac = p14_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P14_JAC evaluates the jacobian for problem p14.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Input, real T, Y(NEQN), the arguments of the jacobian.
%
%    Output, real JAC(NEQN,NEQN), the jacobian matrix.
%
  jac = zeros ( neqn, neqn );

  for i = 2 : neqn
    jac(i,i-1) = 1.0;
  end

  for i = 1 : neqn
    jac(i,i) = -2.0;
  end

  for i = 1 : neqn - 1
    jac(i,i+1) = 1.0;
  end

  return
end
