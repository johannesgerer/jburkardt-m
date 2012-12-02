function f = p05_fun ( option, n, x )

%*****************************************************************************80
%
%% P05_FUN evaluates the integrand for problem 5.
%
%  Discussion:
%
%    The exact value is pi / 3.
%
%    Integral ( -oo < x < +oo ) dx / ( (1+x^2) sqrt(4+3x^2) )
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

  f(1:n) = 1.0 ./ ( ( 1.0 + x(1:n).^2 ) .* sqrt ( 4.0 + 3.0 * x(1:n).^2 ) );

  if ( option == 0 )

  elseif ( option == 1 )
    f(1:n) = f(1:n) .* exp ( x(1:n).^2 );
  elseif ( option == 2 )
    f(1:n) = f(1:n) .* exp ( 0.5 * x(1:n).^2 );
  end

  return
end
