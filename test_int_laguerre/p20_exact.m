function exact = p20_exact ( )

%*****************************************************************************80
%
%% P20_EXACT returns the exact integral for problem 20.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  beta = 1.0;

  exact = ...
    ( ...
      log ( 1.5 ) / 2.0^beta ...
      - 1.0 / 2.0^( beta + 1.0 ) * ...
      log ( ( 16.0 + 0.25^beta ) / ( 1.0 + 0.25^beta ) ) ...
      - atan ( 2.0^( beta + 2.0 ) ) - atan ( 2.0^beta ) ...
    ) / ( 1.0 + 0.25^beta );

  return
end
