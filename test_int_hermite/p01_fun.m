function f = p01_fun ( option, n, x )

%*****************************************************************************80
%
%% P01_FUN evaluates the integrand for problem 1.
%
%  Discussion:
%
%    Squire gives exact value as sqrt(pi) * exp(-w*w).
%
%    Integral ( -oo < x < oo ) exp(-x*x) cos(2*w*x) dx
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
%    William Squire,
%    Comparison of Gauss-Hermite and Midpoint Quadrature with Application
%    to the Voigt Function,
%    in Numerical Integration:
%    Recent Developments, Software and Applications,
%    edited by Patrick Keast, Graeme Fairweather,
%    Reidel, 1987, pages 337-340,
%    ISBN: 9027725144,
%    LC: QA299.3.N38.
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

  omega = 1.0;

  f(1:n) = cos ( 2.0 * omega * x(1:n) );

  if ( option == 0 )
    f(1:n) = f(1:n) .* exp ( - x(1:n).^2 );
  elseif ( option == 1 )

  elseif ( option == 2 )
    f(1:n) = f(1:n) .* exp ( - 0.5 * x(1:n).^2 );
  end

  return
end
