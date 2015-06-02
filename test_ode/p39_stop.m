function [ t_stop, y_stop ] = p39_stop ( neqn )

%*****************************************************************************80
%
%% P39_STOP returns the stopping point for problem p39.
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

  a = p39_param ( 'GET', 'A', [] );
  b = p39_param ( 'GET', 'B', [] );
  if ( a ~= 0.0 )
    t_stop = ( b + 9.0 ) / a;
    y_stop = -3.0;
  elseif ( b ~= 0.0 )
    t_stop = 0.0;
    y_stop = 0.0;
  else
    t_stop = 10.0;
    y_stop = 0.1;
  end

  return
end
