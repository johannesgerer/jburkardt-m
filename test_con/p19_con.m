function [ con, flow ] = p19_con ( nvar, press, temper, x )

%*****************************************************************************80
%
%% P19_CON returns physical constants.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real PRESS, the pressure in atmospheres.
%
%    Input, real TEMPER, the temperature in degrees Kelvin.
%
%    Input, real X(NVAR), the point where the jacobian is evaluated.
%
%    Output, real CON(5), the equilibrium constants for the reagants.
%
%    Output, real FLOW(5), the flow rates for the reagants.
%

%
%  Set flow rates.
%
  flow(1) = 10.0;
  flow(2) = 10.0;
  flow(3) = 10.0;
  flow(4) = 100.0;
  flow(5) = 100.0;
%
%  Set the equilibrium constants.
%
  con(1) = 1333.0 / press;

  con(2) = 33.0 / press;

  con(3) = 28780.0 / press;

  arg = 11.99 - 4004.0 / ( temper - 39.06 ) ...
    - 8546.0 * x(5) * x(5) / temper ...
    + 4.0 * x(5) * x(5) + 6754.0 * x(5) * x(5) * x(4) / temper ...
    - 8.0 * x(5) * x(5) * x(4) - log ( press );

  con(4) = exp ( arg );

  arg = 10.98 - 3362.0 / ( temper - 50.79 ) ...
    - 2872.0 * x(4) * x(4) / temper ...
    - 6754.0 * x(5) * x(4) * x(4) / temper ...
    + 8.0 * x(5) * x(4) * x(4) - log ( press );

  con(5) = exp ( arg );

  return
end
