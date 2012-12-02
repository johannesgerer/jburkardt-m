function exact = p45_exact ( )

%*****************************************************************************80
%
%% P45_EXACT returns the exact integral for problem 45.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  alpha = p45_param_get ( );

  exact = pi * cos ( 2.0^( alpha - 1.0 ) ) * besselj ( 0, 2.0^( alpha - 1.0 ) );

  return
end
