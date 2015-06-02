function [ t_stop, y_stop ] = p28_stop ( neqn )

%*****************************************************************************80
%
%% P28_STOP returns the stopping point for problem p28.
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
   -3.726957553088175e-01; ...
   -6.230137949234190e-01 ];

  return
end
