function fx = p21_fun ( n, x )

%*****************************************************************************80
%
%% P21_FUN evaluates the integrand for problem 21.
%
%  Interval:
%
%    0 <= X <= 1
%
%  Integrand:
%
%       ( sech (   10.0 * ( x - 0.2 ) ) )^2
%     + ( sech (  100.0 * ( x - 0.4 ) ) )^4
%     + ( sech ( 1000.0 * ( x - 0.6 ) ) )^6
%
%  Exact Integral:
%
%    ( 1 + tanh ( 8 ) * tanh ( 2 ) ) / 10.0 + 2 / 150 + 2 / 1875
%
%  Approximate Integral (20 digits):
%
%    0.21080273631018169851...
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
  fx = ...
      ( sech (   10.0 * ( x - 0.2 ) ) ).^2 ...
    + ( sech (  100.0 * ( x - 0.4 ) ) ).^4 ...
    + ( sech ( 1000.0 * ( x - 0.6 ) ) ).^6;

  return
end
