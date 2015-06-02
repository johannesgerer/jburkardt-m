function [ t_stop, y_stop ] = p16_stop ( neqn )

%*****************************************************************************80
%
%% P16_STOP returns the stopping point for problem p16.
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
    2.198835352008397e-01; ...
    9.427076846341813e-01; ...
   -9.787659841058176e-01; ...
    3.287977990962036e-01 ];

  return
end
