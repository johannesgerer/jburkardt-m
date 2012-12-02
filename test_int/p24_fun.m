function fx = p24_fun ( n, x )

%*****************************************************************************80
%
%% P24_FUN evaluates the integrand for problem 24.
%
%  Discussion:
%
%    The integrand is continuous, but nowhere differentiable.
%
%  Interval:
%
%    0 <= x <= 0.5
%
%  Integrand:
%
%    ( 1 / pi ) * sum ( 1 <= I < +oo ) 2^(-I) * cos ( 7^I * pi * X )
%
%  Approximate Integral:
%
%    - 0.0067547455
%
%  Antiderivative:
%
%    ( 1 / pi^2 ) * sum ( 1 <= I < +oo ) 14^(-I) * sin ( 7^I * pi * X )
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
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%    Herbert Salzer, Norman Levine,
%    Table of a Weierstrass Continuous Nondifferentiable Function,
%    Mathematics of Computation,
%    Volume 15, pages 120 - 130, 1961.
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  n_term = 40;

  fx = zeros ( size ( x ) );
  for i = 1 : n_term
    fx = fx + cos ( 7.0^i * pi * x ) / 2.0^i;
  end
  fx = fx / pi;

  return
end
