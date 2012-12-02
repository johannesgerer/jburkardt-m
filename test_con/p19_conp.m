function [ dc4dx4, dc4dx5, dc5dx4, dc5dx5 ] = p19_conp ( con, nvar, temper, x )

%*****************************************************************************80
%
%% P19_CONP returns physical constant derivatives.
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
%    Input, real CON(5), the equilibrium constants for the reagants.
%
%    Input, integer NVAR, the number of variables.
%
%    Input, real TEMPER, the temperature in degrees Kelvin.
%
%    Input, real X(NVAR), the point where the jacobian is evaluated.
%
%    Output, real DC4DX4, DC4DX5, DC5DX4, DC5DX5, the values of
%    d CON(4)/d X(4), d CON(4)/d X(5), d CON(5)/d X(4) and d CON(5)/d X(5).
%
  dc4dx4 = con(4) * ( 6754.0 * x(5) * x(5) / temper - 8.0 * x(5) * x(5) );

  dc4dx5 = con(4) * ( -8546.0 * 2.0 * x(5) / temper ...
     + 8.0 * x(5) + 6754.0 * 2.0 * x(4) * x(5) / temper ...
     - 16.0 * x(5) * x(4) );

  dc5dx4 = con(5) * ( -2872.0 * 2.0 * x(4) / temper ...
     - 6754.0 * 2.0 * x(4) * x(5) / temper + 16.0 * x(4) * x(5) );

  dc5dx5 = con(5) * ( -6754.0 * x(4) * x(4) / temper + 8.0 * x(4) * x(4) );

  return
end
