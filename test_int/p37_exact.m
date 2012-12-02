function exact = p37_exact ( )

%*****************************************************************************80
%
%% P37_EXACT returns the exact integral for problem 37.
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
  alpha = p37_param_get ( );

  exact = atan ( ( 4.0 - pi ) * 4.0^( alpha - 1.0 ) ) ...
        + atan (         pi   * 4.0^( alpha - 1.0 ) );

  return
end
