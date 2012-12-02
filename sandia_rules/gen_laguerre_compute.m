function [ x, w ] = laguerre_compute ( n, alpha )

%*****************************************************************************80
%
%% GEN_LAGUERRE_COMPUTE: generalized Gauss-Laguerre quadrature rule.
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
%    The integral:
%
%      integral ( 0 <= x < +oo ) x^alpha * f(x) dx
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * exp ( x(i) ) * f ( x(i) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    FORTRAN90 version by John Burkardt.
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
  zemu = gamma ( alpha + 1.0 );
%
%  Define the Jacobi matrix.
%
  bj = zeros ( n, 1 );

  for i = 1 : n
    bj(i) = sqrt ( i * ( i + alpha ) );
  end

  x = zeros ( n, 1 );
  for i = 1 : n
    x(i) = 2 * i - 1 + alpha;
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
