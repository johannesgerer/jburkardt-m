function exact = p06_e ( )

%*****************************************************************************80
%
%% P06_E returns the exact value of the integral for problem 06.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the exact value of the integral.
%
  exact = ( pi - 2.0 + 2.0 * log ( 2.0 ) ) / 12.0;

  return
end
