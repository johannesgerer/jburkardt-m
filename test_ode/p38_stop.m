function [ t_stop, y_stop ] = p38_stop ( neqn )

%*****************************************************************************80
%
%% P38_STOP returns the stopping point for problem p38.
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
  delta = p38_param ( 'GET', 'DELTA' );
  t_stop = 2.0 / delta;
  y_stop = zeros ( neqn, 1 );
  y_stop(1) = 1.0;

  return
end
