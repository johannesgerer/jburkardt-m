function exact = p42_exact ( )

%*****************************************************************************80
%
%% P42_EXACT returns the exact integral for problem 42.
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
  alpha = p42_param_get ( );

  exact = 2.0^( alpha - 2.0 ) * ( gamma ( alpha / 2.0 ) )^2 / gamma ( alpha );

  return
end
