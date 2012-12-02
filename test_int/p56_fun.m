function fx = p56_fun ( n, x )

%*****************************************************************************80
%
%% P56_FUN evaluates the integrand for problem 56.
%
%  Interval:
%
%    -1 <= x <= 1
%
%  Integrand:
%
%    1 / ( x^6 + 0.9 )
%
%  Approximate Integral (20 digits):
%
%    1.9922524079504000171...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    David Kahaner,
%    Comparison of Numerical Quadrature Formulas,
%    in Mathematical Software,
%    edited by John R Rice,
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
  fx(1:n) = 1.0 ./ ( x(1:n).^6 + 0.9 );

  return
end
