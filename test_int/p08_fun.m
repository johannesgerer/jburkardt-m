function fx = p08_fun ( n, x )

%*****************************************************************************80
%
%% P08_FUN evaluates the integrand for problem 8.
%
%  Interval:
%
%    0 <= x <= 1
%
%  Integrand:
%
%    1 / ( 1 + x^4 )
%
%  Antiderivative:
%
%    (1/8) * sqrt ( 2 )
%    * ln ( ( X^2 + sqrt ( 2 ) * X+ 1 ) / ( X^2 - sqrt ( 2 ) * X + 1 ) )
%    + (1/4) * sqrt ( 2 ) * arctan ( sqrt ( 2 ) * X / ( 1 - X^2 ) )
%
%  Approximate Integral (20 digits):
%
%    0.86697298733991103757...
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
  fx = 1.0 ./ ( 1.0 + x.^4 );

  return
end
