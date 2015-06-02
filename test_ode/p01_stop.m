function [ t_stop, y_stop ] = p01_stop ( neqn )

%*****************************************************************************80
%
%% P01_STOP returns the stopping point for problem p01.
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
%    Output, real T_STOP, Y_STOP(NEQN), the final data.
%
  y_stop = zeros ( neqn, 1 );

  t_stop = 20.0;
  y_stop(1) = 2.061153353012535E-09;

  return
end
