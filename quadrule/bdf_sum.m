function result = bdf_sum ( func, n, x, w )

%*****************************************************************************80
%
%% BDF_SUM carries out an explicit backward difference quadrature rule for [0,1].
%
%  Discussion:
%
%    The integral:
%
%      Integral ( 0 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      sum ( 1 <= I <= N ) W(I) * BDF^(I-1) FUNC ( 0 )
%
%    The integral from 0 to 1 is approximated using data at X = 0,
%    -1, -2, ..., -N+1.  This is a form of extrapolation, and
%    the approximation can become poor as N increases.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, the function which evaluates
%    the integrand.  The function must have the form
%      function value = func ( x ).
%
%    Input, integer N, the order.
%
%    Input, real X(N), the abscissas.
%
%    Input, real W(N), the weights.
%
%    Output, real RESULT, the approximate value of the integral.
%
  diftab = zeros ( n, 1 );

  for i = 1 : n
    diftab(i) = func ( x(i) );
  end

  for i = 2 : n
    for j = i : n
      diftab(n+i-j) = ( diftab(n+i-j-1) - diftab(n+i-j) );
    end
  end

  result = w(1:n)' * diftab(1:n);

  return
end
