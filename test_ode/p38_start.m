function [ t_start, y_start ] = p38_start ( neqn )

%*****************************************************************************80
%
%% P38_START returns the starting point for problem p38.
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
%    Output, real T_START, Y_START(NEQN), the initial data.
%
  delta = p38_param ( 'GET', 'DELTA' );
  t_start = 0.0;
  y = zeros ( neqn, 1 );
  y_start(1) = delta;

  return
end
