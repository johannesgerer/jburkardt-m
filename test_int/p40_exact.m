function exact = p40_exact ( )

%*****************************************************************************80
%
%% P40_EXACT returns the exact integral for problem 40.
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
  alpha = p40_param_get ( );

  exact = ( ( 1.0 - 0.25 * pi )^( alpha + 1.0 ) ...
          + (     + 0.25 * pi )^( alpha + 1.0 ) ) ...
          / ( alpha + 1.0 );

  return
end
