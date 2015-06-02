function jac = p29_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P29_JAC evaluates the jacobian for problem p29.
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

  if ( t <= 10.0 )
    jac(1,1) = 0.0;
  else
    jac(1,1) = -2.0;
  end

  return
end
