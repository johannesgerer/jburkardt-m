function [ t_stop, y_stop ] = p18_stop ( neqn )

%*****************************************************************************80
%
%% P18_STOP returns the stopping point for problem p18.
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
   -5.780432953035361e-01; ...
    8.633840009194193e-01; ...
   -9.595083730380727e-01; ...
   -6.504915126712089e-02 ];

  return
end
