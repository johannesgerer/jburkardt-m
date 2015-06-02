function f = p08_fun ( option, n, x )

%*****************************************************************************80
%
%% P08_FUN evaluates the integrand for problem 8.
%
%  Discussion:
%
%    The exact value is sqrt ( 2 pi ) * HypergeometricU ( -1/2, 0, 1 ).
%
%    Integral ( -oo < x < +oo ) sqrt(1+x*x/2) * exp(-x*x/2) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2010
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

  f(1:n) = sqrt ( 1.0 + 0.5 * x(1:n).^2 );

  if ( option == 0 )
    f(1:n) = f(1:n) .* exp ( - 0.5 * x(1:n).^2 );
  elseif ( option == 1 )
    f(1:n) = f(1:n) .* exp ( + 0.5 * x(1:n).^2 );
  elseif ( option == 2 )

  end

  return
end
