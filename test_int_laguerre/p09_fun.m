function fx = p09_fun ( n, x )

%*****************************************************************************80
%
%% P09_FUN evaluates the integrand for problem 9.
%
%  Discussion:
%
%    The integral is the definition of the Gamma function for
%    Z = 5, with exact value (Z-1)! = 24.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) x^4 exp ( -x ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2011
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
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the function values.
%
  fx(1:n) = x(1:n).^4 .* exp ( - x(1:n) );

  return
end
