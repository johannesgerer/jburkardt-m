function f = p03_fun ( option, n, x )

%*****************************************************************************80
%
%% P03_FUN evaluates the integrand for problem 3.
%
%  Discussion:
%
%    The exact value is pi / (q*sin(pi*p/q) ), assuming 0 < p < q.
%
%    Integral ( -oo < x < +oo ) exp(-px) / ( 1 + exp ( -qx) ) dx
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

  p = 1.0;
  q = 3.0;

  f(1:n) = exp ( - p * x(1:n) ) ./ ( 1.0 + exp ( -q * x(1:n) ) );

  if ( option == 0 )

  elseif ( option == 1 )
    f(1:n) = f(1:n) .* exp ( x(1:n).^2 );
  elseif ( option == 2 )
    f(1:n) = f(1:n) .* exp ( 0.5 * x(1:n).^2 );
  end

  return
end
