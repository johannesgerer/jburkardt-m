function [ x, w ] = line_ncc_rule ( n, a, b )

%*****************************************************************************80
%
%% LINE_NCC_RULE computes a Newton-Cotes Closed (NCC) quadrature rule.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( A <= X <= B ) F(X) dx
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Input, real A, B, the endpoints of the interval.
%
%    Input, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Define the points X.
%
  x = linspace ( a, b, n );
  x = x';

%
%  Compute the Lagrange basis polynomial which is 1 at X(I),
%  and zero at the other nodes.
%
  w = zeros ( n, 1 );

  for i = 1 : n

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
      yvala = yvala * a + d(j) / j;
    end
    yvala = yvala * a;

    yvalb = d(n) / n;
    for j = n - 1 : -1 : 1
      yvalb = yvalb * b + d(j) / j;
    end
    yvalb = yvalb * b;

    w(i) = yvalb - yvala;

  end

  return
end
