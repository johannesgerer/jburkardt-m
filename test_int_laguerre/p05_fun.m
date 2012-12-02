function fx = p05_fun ( n, x )

%*****************************************************************************80
%
%% P05_FUN evaluates the integrand for problem 5.
%
%  Discussion:
%
%    D&R gives "exact" value as  0.00158973
%    Mathematica returns         0.0015897286158592328774...
%    D&R gives Laguerre(16) as  -0.067859545...
%
%  Integral:
%
%    exp ( -2 ) Integral ( 2 <= x < +oo ) cos ( pi * x^2 / 2 ) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2007
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
  fx(1:n) = exp ( - 2.0 ) * cos ( 0.5 * pi * x(1:n).^2 );

  return
end
