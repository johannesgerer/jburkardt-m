function [ t_stop, y_stop ] = p07_stop ( neqn )

%*****************************************************************************80
%
%% P07_STOP returns the stopping point for problem p07.
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
    1.000000001030576; ...
    1.000000000000000; ...
    0.9999999989694235 ];

  return
end
