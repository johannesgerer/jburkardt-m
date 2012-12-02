function result = laguerre_sum ( func, a, n, x, w )

%*****************************************************************************80
%
%% LAGUERRE_SUM carries out Laguerre quadrature over [ A, +oo ).
%
%  Discussion:
%
%    The integral:
%
%      integral ( 0 <= x <= +oo ) exp ( -x ) * f(x) dx 
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * f ( x(i) )
%
%    The integral:
%
%      integral ( a <= x <= +oo ) exp ( -x ) * f(x) dx
%
%    The quadrature rule:
%
%      exp ( - a ) * sum ( 1 <= i <= n ) w(i) * f ( x(i) + a ) 
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Abramowitz, Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964.
%
%    Daniel Zwillinger, editor,
%    Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, external FUNC, the name of the function which
%    evaluates the integrand.  The function must have the form
%      function func ( x ).
%
%    Input, real A, the beginning of the integration interval.
%
%    Input, integer N, the order.
%
%    Input, real X(N), the abscissas.
%
%    Input, real W(N), the weights.
%
%    Output, real RESULT, the approximate value of the integral.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LAGUERRE_SUM - Fatal error!\n' );
    fprintf ( 1, '  Nonpositive N = %d\n', n );
    error ( 'LAGUERRE_SUM - Fatal error!' );
  end

  result = 0.0;
  for i = 1 : n
    result = result + w(i) * func ( x(i) + a );
  end

  result = exp ( - a ) * result;

  return
end
