function [ t_stop, y_stop ] = p32_stop ( neqn )

%*****************************************************************************80
%
%% P32_STOP returns the stopping point for problem p32.
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
    0.0; ...
    0.0; ...
    0.0 ];

  return
end
