function [ t_stop, y_stop ] = p20_stop ( neqn )

%*****************************************************************************80
%
%% P20_STOP returns the stopping point for problem p20.
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
   -1.295266250987574; ...
    4.003938963792321e-01; ...
   -6.775390924707566e-01; ...
   -1.270838154278686e-01 ];

  return
end
