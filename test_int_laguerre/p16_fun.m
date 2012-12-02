function fx = p16_fun ( n, x )

%*****************************************************************************80
%
%% P16_FUN evaluates the integrand for problem 16.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) cos ( pi * x / 2 ) / sqrt ( x ) dx
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
%    Robert Piessens, Elise deDoncker-Kapenga, 
%    Christian Ueberhuber, David Kahaner,
%    QUADPACK: A Subroutine Package for Automatic Integration,
%    Springer, 1983,
%    ISBN: 3540125531,
%    LC: QA299.3.Q36.
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real FX(N), the function values.
%
  fx(1:n) = cos ( pi * x(1:n) / 2.0 ) ./ sqrt ( x(1:n) );

  return
end
