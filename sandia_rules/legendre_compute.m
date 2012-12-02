function [ x, w ] = legendre_compute ( n )

%*****************************************************************************80
%
%% LEGENDRE_COMPUTE: Legendre quadrature rule by the Elhay-Kautsky method.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2011
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
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%

%
%  Define the zero-th moment.
%
  zemu = 2.0;
%
%  Define the Jacobi matrix.
%
  bj = zeros ( n, 1 );

  for i = 1 : n
    bj(i) = ( i * i ) / ( 4 * i * i - 1 );
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
