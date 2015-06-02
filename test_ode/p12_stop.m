function [ t_stop, y_stop ] = p12_stop ( neqn )

%*****************************************************************************80
%
%% P12_STOP returns the stopping point for problem p12.
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
    2.061153577984930e-09; ...
    2.061153573736588e-09; ...
    2.061153569488245e-09; ...
    2.061153565239902e-09; ...
    2.061153560991560e-09; ...
    2.061153556743217e-09; ...
    2.061153552494874e-09; ...
    2.061153548246532e-09; ...
    2.061153543998189e-09; ...
    9.999999814496180e-01 ];

  return
end
