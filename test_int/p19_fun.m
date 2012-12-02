function fx = p19_fun ( n, x )

%*****************************************************************************80
%
%% P19_FUN evaluates the integrand for problem 19.
%
%  Discussion:
%
%    The integrand is singular at X = 0.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    ln ( x )
%
%  Antiderivative:
%
%    x * ln ( x ) - x
%
%  Exact Integral:
%
%    -1
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
  fx = log ( x );

  i = find ( x == 0.0 );
  fx(i) = 0.0;

  return
end
