function [ t_stop, y_stop ] = p08_stop ( neqn )

%*****************************************************************************80
%
%% P08_STOP returns the stopping point for problem p08.
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
    2.061153488557776e-09; ...
    5.257228022048349e-02; ...
    9.474277177183630e-01 ];

  return
end
