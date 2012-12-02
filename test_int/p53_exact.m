function exact = p53_exact ( )

%*****************************************************************************80
%
%% P53_EXACT returns the exact integral for problem 53.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = 0.5 * pi - atan ( 1.0 / sqrt ( 2.0 ) ) + log ( 3.0 ) / 2.0;

  return
end
