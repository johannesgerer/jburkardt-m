function exact = p07_exact ( )

%*****************************************************************************80
%
%% P07_EXACT returns the exact integral for problem 7.
%
%  Discussion:
%
%    The 20 digit values of pi^(1/2) and e^(1/4) were computed by Mathematica.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real EXACT, the value of the integral.
%
  e_sqrt_sqrt = 1.2840254166877414841;
  pi_sqrt = 1.7724538509055160273;

  exact = 0.25 * pi_sqrt / e_sqrt_sqrt;

  return
end
