function exact = p04_e ( )

%*****************************************************************************80
%
%% P04_E returns the exact value of the integral for problem 04.
%
%  Discussion:
%
%    The 20 digit estimate for the exact value comes from Mathematica.
%
%    N [ Integrate [ Exp[-x*x]*Log[1 + x], { x, -1, 1 } ], 20 ]
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
  exact = -0.31671419631358172053;

  return
end
