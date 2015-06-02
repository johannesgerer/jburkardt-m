function f = p07_fun ( option, n, x )

%*****************************************************************************80
%
%% P07_FUN evaluates the integrand for problem 7.
%
%  Discussion:
%
%    The exact value is (1/4) sqrt(pi) / sqrt(sqrt(e)).
%
%    Integral ( -oo < x < +oo ) x^2 cos(x) e^(-x^2) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Prem Kythe, Michael Schaeferkotter,
%    Handbook of Computational Methods for Integration,
%    Chapman and Hall, 2004,
%    ISBN: 1-58488-428-2,
%    LC: QA299.3.K98.
%
%  Parameters:
%
%    Input, integer OPTION:
%    0, integrand is f(x).
%    1, integrand is exp(-x*x) * f(x);
%    2, integrand is exp(-x*x/2) * f(x);
%
%    Input, integer N, the number of points.
%
%    Input, real X(N), the evaluation points.
%
%    Output, real F(N), the function values.
%
  x = x ( : );
  f = zeros ( n, 1 );

  if ( option == 0 )
    f(1:n) = x(1:n).^2 .* cos ( x(1:n) ) .* exp ( - x(1:n).^2 );
  elseif ( option == 1 )
    f(1:n) = x(1:n).^2 .* cos ( x(1:n) );
  elseif ( option == 2 )
    f(1:n) = x(1:n).^2 .* cos ( x(1:n) ) .* exp ( - x(1:n).^2 / 2.0 );
  end

  return
end
