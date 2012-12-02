function exact = p08_exact ( )

%*****************************************************************************80
%
%% P08_EXACT returns the exact integral for problem 8.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 September 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  exact = 0.25 * pi * ( erf ( 1.0 ) + erf ( 4.0 ) ).^2;

  return
end
