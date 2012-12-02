function exact = p51_exact ( )

%*****************************************************************************80
%
%% P51_EXACT returns the exact integral for problem 51.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = - ( r8_ci ( 1.0 ) * sin ( 1.0 ) + ...
    ( 0.5 * pi  - r8_si ( 1.0 ) ) * cos ( 1.0 ) ) / pi;

  return
end
