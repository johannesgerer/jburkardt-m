function f = p06_fun ( option, n, x )

%*****************************************************************************80
%
%% P06_FUN evaluates the integrand for problem 6.
%
%  Discussion:
%
%    The exact value is (m-1)!! * sqrt ( pi ) / sqrt ( 2**m ).
%
%    Integral ( -oo < x < +oo ) x^m exp (-x*x) dx
%
%    The parameter M is set by calling P06_PARAM.
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

  m = 0;
  m = p06_param ( 'G', 'M', m );

  f(1:n) = x(1:n).^m;

  if ( option == 0 )
    f(1:n) = f(1:n) .* exp ( - x(1:n).^2 );
  elseif ( option == 1 )

  elseif ( option == 2 )
    f(1:n) = f(1:n) .* exp ( - 0.5 * x(1:n).^2 );
  end

  return
end
