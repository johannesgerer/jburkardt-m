function fx = p22_fun ( n, x )

%*****************************************************************************80
%
%% P22_FUN evaluates the integrand for problem 22.
%
%  Interval:
%
%    0 <= X <= 1
%
%  Integrand:
%
%    1 / ( X^4 + X^2 + 1 )
%
%  Exact integral:
%
%    ln ( 9 ) / 8 + pi / sqrt ( 48 )
%
%  Approximate Integral (20 digits):
%
%    0.72810291322558188550...
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
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the integrand values.
%
  fx = 1.0 ./ ( x.^4 + x.^2 + 1.0 );

  return
end
