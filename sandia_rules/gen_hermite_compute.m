function [ x, w ] = gen_hermite_compute ( n, alpha )

%*****************************************************************************80
%
%% GEN_HERMITE_COMPUTE computes a generalized Gauss-Hermite quadrature rule.
%
%  Discussion:
%
%    The code uses an algorithm by Elhay and Kautsky.
%
%    The integral:
%
%      integral ( -oo < x < +oo ) |x|^alpha exp(-x^2) f(x) dx
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
%    30 April 2011
%
%  Author:
%
%    Original FORTRAN77 version by Sylvan Elhay, Jaroslav Kautsky.
%    MATLAB version by John Burkardt.
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
%    Input, integer N, the number of abscissas.
%
%    Input, real ( kind = 8 ) ALPHA, the parameter.
%    -1.0 < ALPHA.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Define the zero-th moment.
%
  zemu = gamma ( ( alpha + 1.0 ) / 2.0 );
%
%  Define the Jacobi matrix.
%
  bj = zeros ( n, 1 );
  for i = 1 : n
    if ( mod ( i, 2 ) == 1 )
      bj(i) = ( i + alpha ) / 2.0;
    else
      bj(i) = i / 2.0;
    end
  end
  bj(1:n) = sqrt ( bj(1:n) );

  x = zeros ( n, 1 );

  w = zeros ( n, 1 );
  w(1) = sqrt ( zemu );
%
%  Diagonalize the Jacobi matrix.
%
  [ x, w ] = imtqlx ( n, x, bj, w );

  w(1:n) = w(1:n).^2;

  return
end
