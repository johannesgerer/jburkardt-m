function [ t_stop, y_stop ] = p40_stop ( neqn )

%*****************************************************************************80
%
%% P40_STOP returns the stopping point for problem p40.
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

  e = p40_param ( 'GET', 'E', [] );
  t_stop = 1.0;
  y_stop(1) = - 2.0 * sqrt ( e ) ...
    * exp ( ( 1.0 - t_stop * t_stop ) / ( 2.0 * e ) ) / ...
    ( ...
      2.0 * sqrt ( e ) + ...
      ( ...
        erf ( 1.0 / sqrt ( 2.0 * e ) )  + ...
        erf ( t_stop  / sqrt ( 2.0 + e ) ) ...
      ) ...
      * exp ( 0.5 / e ) * sqrt ( 2.0 * pi ) ...
    );

  return
end
