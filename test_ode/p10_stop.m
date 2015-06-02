function [ t_stop, y_stop ] = p10_stop ( neqn )

%*****************************************************************************80
%
%% P10_STOP returns the stopping point for problem p10.
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
%    Output, real T_STOP, Y_STOP(NEQN), the final data.
%
  y_stop = zeros ( neqn, 1 );

  t_stop = 20.0;
  y_stop = [ ...
   -9.396570798729192e-01; ...
   -3.421177754000779e-01; ...
    7.414126596199957e-01 ];

  return
end
