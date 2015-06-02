function jac = p30_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P30_JAC evaluates the jacobian for problem p30.
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

  csum = 0.0;
  for i = 1 : 19
    csum = csum + i.^(4.0/3.0);
  end

  pprime = 0.0;
  for i = 1 : 19
    pprime = pprime + ( 4.0 / 3.0 ) * r8_cube_root ( t - i );
  end

  jac(1,1) = pprime / csum;

  return
end
