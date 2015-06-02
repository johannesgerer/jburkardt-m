function [ t_stop, y_stop ] = p36_stop ( neqn )

%*****************************************************************************80
%
%% P36_STOP returns the stopping point for problem p36.
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

  t_stop = 100.0;
  y_stop = [ ...
    0.667726; ...
   -0.254738 ];

  return
end
