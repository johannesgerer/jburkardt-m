function r82poly2_print ( a, b, c, d, e, f )

%*****************************************************************************80
%
%% R82POLY2_PRINT prints a second order polynomial in two variables.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, D, E, F, the coefficients.
%
  fprintf ( 1, '  p(x,y) = %g * x^2 + %g * y^2 + %g * xy\n', a, b, c );
  fprintf ( 1, '         + %g * x + %g * y + %g\n', d, e, f );

  return
end
