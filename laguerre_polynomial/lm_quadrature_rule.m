function [ x, w ] = lm_quadrature_rule ( n, m )

%*****************************************************************************80
%
%% LM_QUADRATURE_RULE: Gauss-Laguerre quadrature rule for Lm(n,m,x);
%
%  Discussion:
%
%    The integral:
%
%      integral ( 0 <= x < +oo ) exp ( - x ) * x^m * f(x) dx
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
%    Input, integer M, the parameter.
%    0 <= M.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Define the zero-th moment.
%
  zemu = r8_factorial ( m );
%
%  Define the Jacobi matrix.
%
  b = zeros ( n, 1 );
  for i = 1 : n
    bj(i) = i * ( i + m );
  end
  bj(1:n) = sqrt ( bj(1:n) );

  x = zeros ( n, 1 );
  for i = 1 : n
    x(i) = 2 * i - 1 + m;
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
