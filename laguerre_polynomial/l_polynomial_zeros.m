function x = l_polynomial_zeros ( n )

%*****************************************************************************80
%
%% L_POLYNOMIAL_ZEROS: zeros of the Laguerre polynomial L(n,x).
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
%    Input, integer N, the order of the polynomial.
%
%    Output, real X(N), the zeros.
%

%
%  Define the zero-th moment.
%
  zemu = 1.0;
%
%  Define the Jacobi matrix.
%
  b = zeros ( n, 1 );
  for i = 1 : n
    bj(i) = i;
  end

  x = zeros ( n, 1 );
  for i = 1 : n
    x(i) = 2 * i - 1;
  end

  w = zeros ( n, 1 );
  w(1) = sqrt ( zemu );
%
%  Diagonalize the Jacobi matrix.
%
  [ x, w ] = imtqlx ( n, x, bj, w );

  return
end
