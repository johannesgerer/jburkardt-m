function exact = p11_e ( )

%*****************************************************************************80
%
%% P11_E returns the exact value of the integral for problem 11.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the exact value of the integral.
%
  exact = 2.0 * sqrt ( pi ) * gamma ( 0.75 ) / gamma ( 0.25 );

  return
end
