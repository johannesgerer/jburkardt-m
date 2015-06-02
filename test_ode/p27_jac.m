function jac = p27_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P27_JAC evaluates the jacobian for problem p27.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2013
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

  if ( mod ( floor ( t ), 2 ) == 0 )
    jac(1,1) = - 1.5;
  else
    jac(1,1) = - 0.5;
  end

  return
end
