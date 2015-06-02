function [ t_start, y_start ] = p18_start ( neqn )

%*****************************************************************************80
%
%% P18_START returns the starting point for problem p18.
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
  delta = p18_param ( 'GET', 'DELTA', [] );
  y_start(1) = 1.0 - delta;
  y_start(2) = 0.0;
  y_start(3) = 0.0;
  y_start(4) = sqrt ( ( 1.0 + delta ) / ( 1.0 - delta ) );

  return
end
