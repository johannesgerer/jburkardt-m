function [ t_stop, y_stop ] = p21_stop ( neqn )

%*****************************************************************************80
%
%% P21_STOP returns the stopping point for problem p21.
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
    1.456723600728308e-01; ...
   -9.883500195574063e-02 ];

  return
end
