function fx = p20_fun ( n, x )

%*****************************************************************************80
%
%% P20_FUN evaluates the integrand for problem 20.
%
%  Interval:
%
%    -1 <= x <= 1
%
%  Integrand:
%
%    1 / ( X^2 + 1.005 )
%
%  Antiderivative:
%
%    ( 1 / sqrt ( 1.005 ) ) * arctan ( X / sqrt ( 1.005 ) )
%
%  Approximate Integral (20 digits):
%
%    1.5643964440690497731...
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 November 2009
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
  fx = 1.0 ./ ( x .* x + 1.005 );

  return
end
