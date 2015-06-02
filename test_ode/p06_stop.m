function [ t_stop, y_stop ] = p06_stop ( neqn )

%*****************************************************************************80
%
%% P06_STOP returns the stopping point for problem p06.
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
    0.6761876008576667; ...
    0.1860816099640036 ];

  return
end
