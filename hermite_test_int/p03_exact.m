function exact = p03_exact ( )

%*****************************************************************************80
%
%% P03_EXACT returns the exact integral for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  p = 1.0;
  q = 3.0;

  exact = pi / ( q * sin ( pi * p / q ) );

  return
end
