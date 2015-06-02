function [ t_stop, y_stop ] = p11_stop ( neqn )

%*****************************************************************************80
%
%% P11_STOP returns the stopping point for problem p11.
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
    2.061153622240064e-09; ...
    4.122307244619555e-08; ...
    4.122307244716968e-07; ...
    2.748204829855288e-06; ...
    1.374102414941961e-05; ...
    5.496409659803266e-05; ...
    1.832136553274552e-04; ...
    5.234675866508716e-04; ...
    1.308668966628220e-03; ...
    9.979127409508656e-01 ];

  return
end
