function f = p02_fun ( option, n, x )

%*****************************************************************************80
%
%% P02_FUN evaluates the integrand for problem 2.
%
%  Discussion:
%
%    The exact value is sqrt(pi).
%
%    Integral ( -oo < x < +oo ) exp(-x*x) dx
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

  f(1:n) = 1;

  if ( option == 0 )
    f(1:n) = f(1:n) .* exp ( - x(1:n).^2 );
  elseif ( option == 1 )

  elseif ( option == 2 )
    f(1:n) = f(1:n) .* exp ( - 0.5 * x(1:n).^2 );
  end

  return
end
