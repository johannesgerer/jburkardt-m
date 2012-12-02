function result = summer ( func, n, x, w )

%*****************************************************************************80
%
%% SUMMER carries out a quadrature rule over a single interval.
%
%  Discussion:
%
%    result = sum ( 1 <= i <= n ) w(i) * func ( x(i) )
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
%  Parameters:
%
%    Input, external FUNC, the name of the function which
%    evaluates the integrand.  The function must have the form
%      function func ( x ).
%
%    Input, integer N, the order.
%
%    Input, real X(N), the abscissas.
%
%    Input, real W(N), the weights.
%
%    Output, real RESULT, the approximate integral.
%
  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SUMMER - Fatal error!\n' );
    fprintf ( 1, '  N must be at least 1.\n' );
    fprintf ( 1, '  The input value was N = %d\n', n );
    error ( 'SUMMER - Fatal error!' );
  end

  result = 0.0;
  for i = 1 : n
    result = result + w(i) * func ( x(i) );
  end

  return
end
