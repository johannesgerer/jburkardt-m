function exact = p50_exact ( )

%*****************************************************************************80
%
%% P50_EXACT returns the exact integral for problem 50.
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
  gamma = euler_constant ( );
  t = 10.0 * pi;

  exact = ( - gamma - log ( t ) + r8_ci ( t ) ) / t;

  return
end
