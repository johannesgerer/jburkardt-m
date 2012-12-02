function fx = p05_fun ( n, x )

%*****************************************************************************80
%
%% P05_FUN evaluates the integrand for problem 5.
%
%  Interval:
%
%    -1 <= x <= 1
%
%  Integrand:
%
%    1 / ( x^4 + x^2 + 0.9 )
%
%  Approximate Integral (20 digits):
%
%    1.5822329637296729331...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Charles Clenshaw, Alan Curtis,
%    A Method for Numerical Integration on an Automatic Computer,
%    Numerische Mathematik,
%    Volume 2, Number 1, December 1960, pages 197-205.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = 1.0 ./ ( x.^4 + x.^2 + 0.9 );

  return
end
