function value = p14_gu ( u )

%*****************************************************************************80
%
%% P14_GU computes the auxilliary function G(U).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real U, the argument of the function.
%
%    Output, real VALUE, the value of the function.
%
  beta = 0.1;
  gamma = 0.1;

  value = u / ( beta * ( u + gamma ) );

  return
end
