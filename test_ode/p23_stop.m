function [ t_stop, y_stop ] = p23_stop ( neqn )

%*****************************************************************************80
%
%% P23_STOP returns the stopping point for problem p23.
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
   -1.004178858647128e-01; ...
    2.411400132095954e-01 ];

  return
end
