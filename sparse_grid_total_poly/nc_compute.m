function w = nc_compute ( n, x_min, x_max, x )

%*****************************************************************************80
%
%% NC_COMPUTE computes a Newton-Cotes quadrature rule.
%
%  Discussion:
%
%    For the interval [X_MIN,X_MAX], the Newton-Cotes quadrature rule
%    estimates
%
%      Integral ( X_MIN <= X <= X_MAX ) F(X) dX
%
%    using N abscissas X and weights W:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) ).
%
%    For the CLOSED rule, the equally spaced abscissas include A and B.
%    For the OPEN rule, the equally spaced abscissas do not include A and B.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Input, real X_MIN, X_MAX, the endpoints of the interval.
%
%    Input, real X(N), the abscissas.
%
%    Output, real W(N,1), the weights.
%
  d = zeros ( n, 1 );
  w = zeros ( n, 1 );

  for i = 1 : n
%
%  Compute the Lagrange basis polynomial which is 1 at X(I),
%  and zero at the other nodes.
%
    d(1:n) = 0.0;
    d(i) = 1.0;

    for j = 2 : n
      for k = j : n
        d(n+j-k) = ( d(n+j-k-1) - d(n+j-k) ) / ( x(n+1-k) - x(n+j-k) );
      end
    end

    for j = 1 : n - 1
      for k = 1 : n - j
        d(n-k) = d(n-k) - x(n-k-j+1) * d(n-k+1);
      end
    end
%
%  Evaluate the antiderivative of the polynomial at the endpoints.
%
    yvala = d(n) / n;
    for j = n - 1 : -1 : 1
      yvala = yvala * x_min + d(j) / j;
    end
    yvala = yvala * x_min;

    yvalb = d(n) / n;
    for j = n - 1 : -1 : 1
      yvalb = yvalb * x_max + d(j) / j;
    end
    yvalb = yvalb * x_max;

    w(i) = yvalb - yvala;

  end

  return
end
