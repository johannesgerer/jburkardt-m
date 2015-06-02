function fx = p15_fun ( n, x )

%*****************************************************************************80
%
%% P15_FUN evaluates the integrand for problem 15.
%
%  Integral:
%
%    Integral ( 0 <= x < +oo ) log(x) / (1+100*x*x) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 December 2001
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
  fx(1:n) = log ( x(1:n) ) ./ ( 1.0 + 100.0 * x(1:n).^2 );

  return
end
