function [ t_stop, y_stop ] = p19_stop ( neqn )

%*****************************************************************************80
%
%% P19_STOP returns the stopping point for problem p19.
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
   -9.538990293416394e-01; ...
    6.907409024219432e-01; ...
   -8.212674270877433e-01; ...
   -1.539574259125825e-01 ];

  return
end
