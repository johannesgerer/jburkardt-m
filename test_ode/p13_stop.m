function [ t_stop, y_stop ] = p13_stop ( neqn )

%*****************************************************************************80
%
%% P13_STOP returns the stopping point for problem p13.
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
    2.948119211022058e-03; ...
    5.635380154844266e-03; ...
    7.829072515926013e-03; ...
    9.348257908594937e-03; ...
    1.007943610301970e-02; ...
    9.982674171429909e-03; ...
    9.088693332766085e-03; ...
    7.489115195185912e-03; ...
    5.322964130953349e-03; ...
    2.762434379029886e-03 ];

  return
end
