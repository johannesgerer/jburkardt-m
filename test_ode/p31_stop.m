function [ t_stop, y_stop ] = p31_stop ( neqn )

%*****************************************************************************80
%
%% P31_STOP returns the stopping point for problem p31.
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
    2.20050; ...
    10.2726 ];

  return
end
