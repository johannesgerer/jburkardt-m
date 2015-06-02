function [ t_start, y_start ] = p22_start ( neqn )

%*****************************************************************************80
%
%% P22_START returns the starting point for problem p22.
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
%    Output, real T_START, Y_START(NEQN,1), the initial data.
%
  y_start = zeros ( neqn, 1 );

  t_start = 0.0;
  y_start = [ 2.0; 0.0 ];

  return
end
