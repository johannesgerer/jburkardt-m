function scale = p38_scale ( neqn )

%*****************************************************************************80
%
%% P38_SCALE returns scale factors for problem p38.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 February 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NEQN, the number of equations.
%
%    Output, real SCALE(NEQN), the scaling factors.
%
  scale = zeros ( neqn, 1 );

  scale(1:neqn,1) = 1.0;

  return
end
