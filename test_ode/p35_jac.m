function jac = p35_jac ( neqn, t, y )

%*****************************************************************************80
%
%% P35_JAC evaluates the jacobian for problem p35.
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

  g = p35_param ( 'GET', 'G', [] );
  k = p35_param ( 'GET', 'K', [] );
  l = p35_param ( 'GET', 'L', [] );
  m = p35_param ( 'GET', 'M', [] );

  jac(1,1) =  0.0;
  jac(1,2) =  1.0;

  jac(2,1) = - ( g / l ) * cos ( y(1) );
  jac(2,2) = - ( k / m );

  return
end
