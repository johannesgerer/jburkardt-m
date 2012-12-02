function exact = p19_exact ( )

%*****************************************************************************80
%
%% P19_EXACT returns the exact integral for problem 19.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  beta = 0.5;

  exact = ( 1.0 - beta ) * pi / ( 10.0^beta * sin ( pi * beta ) );

  return
end
