function [ t_stop, y_stop ] = p17_stop ( neqn )

%*****************************************************************************80
%
%% P17_STOP returns the stopping point for problem p17.
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
   -1.777027357140412e-01; ...
    9.467784719905892e-01; ...
   -1.030294163192969; ...
    1.211074890053952e-01 ];

  return
end
