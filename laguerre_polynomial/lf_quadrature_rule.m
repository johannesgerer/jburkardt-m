function [ x, w ] = lf_quadrature_rule ( n, alpha )

%*****************************************************************************80
%
%% LF_QUADRATURE_RULE: Gauss-Laguerre quadrature rule for Lf(n,alpha,x);
%
%  Discussion:
%
%    The integral:
%
%      integral ( 0 <= x < +oo ) exp ( - x ) * x^alpha * f(x) dx
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * f ( x(i) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt.
%
%  Reference:
%
%    Sylvan Elhay, Jaroslav Kautsky,
%    Algorithm 655: IQPACK, FORTRAN Subroutines for the Weights of
%    Interpolatory Quadrature,
%    ACM Transactions on Mathematical Software,
%    Volume 13, Number 4, December 1987, pages 399-415.
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Input, real ALPHA, the exponent of the X factor.
%    ALPHA must be nonnegative.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Define the zero-th moment.
%
  zemu = r8_gamma ( alpha + 1.0 );
%
%  Define the Jacobi matrix.
%
  b = zeros ( n, 1 );
  for i = 1 : n
    bj(i) = i * ( i + alpha );
  end
  bj(1:n) = sqrt ( bj(1:n) );

  x = zeros ( n, 1 );
  for i = 1 : n
    x(i) = 2.0 * i - 1.0 + alpha;
  end

  w = zeros ( n, 1 );
  w(1) = sqrt ( zemu );
%
%  Diagonalize the Jacobi matrix.
%
  [ x, w ] = imtqlx ( n, x, bj, w );

  w(1:n) = w(1:n).^2;

  return
end
