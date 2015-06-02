function [ t_stop, y_stop ] = p09_stop ( neqn )

%*****************************************************************************80
%
%% P09_STOP returns the stopping point for problem p09.
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
    9.826950928005993e-01; ...
    2.198447081694832; ...
    9.129452507276399e-01 ];

  return
end
