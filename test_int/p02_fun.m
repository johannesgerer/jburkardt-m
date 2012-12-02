function fx = p02_fun ( n, x )

%*****************************************************************************80
%
%% P02_FUN evaluates the integrand for problem 2.
%
%  Discussion:
%
%    The integrand is discontinuous at X = 0.3.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    if ( x < 0.3 )
%      f(x) = 0
%    else
%      f(x) = 1
%
%  Antiderivative:
%
%    if ( x < 0.3 )
%      g(x) = 0
%    else
%      g(x) = X - 0.3
%
%  Exact Integral:
%
%    0.7
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
  fx = ( 0.3 <= x );

  return
end
