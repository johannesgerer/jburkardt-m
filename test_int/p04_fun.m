function fx = p04_fun ( n, x )

%*****************************************************************************80
%
%% P04_FUN evaluates the integrand for problem 4.
%
%  Interval:
%
%    -1 <= x <= 1
%
%  Integrand:
%
%    0.92 * cosh ( x ) - cos ( x )
%
%  Antiderivative:
%
%    0.92 * sinh ( x ) - sin ( x )
%
%  Exact Integral:
%
%    1.84 * sinh ( 1 ) - 2 * sin ( 1 )
%
%  Approximate Integral (20 digits):
%
%    0.47942822668880166736...
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
%    David Kahaner,
%    Comparison of Numerical Quadrature Formulas,
%    in Mathematical Software, edited by John R Rice,
%    Academic Press, 1971.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = 0.92 * cosh ( x ) - cos ( x );

  return
end
