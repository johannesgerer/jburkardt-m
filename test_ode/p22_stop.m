function [ t_stop, y_stop ] = p22_stop ( neqn )

%*****************************************************************************80
%
%% P22_STOP returns the stopping point for problem p22.
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
    2.008149762174948; ...
   -4.250887527320057e-02 ];

  return
end
