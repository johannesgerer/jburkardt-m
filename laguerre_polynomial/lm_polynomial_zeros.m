function x = lm_polynomial_zeros ( n, m )

%*****************************************************************************80
%
%% LM_POLYNOMIAL_ZEROS returns the zeros for Lm(n,m,x).
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
%    Input, integer M, the parameter.
%    0 <= M.
%
%    Output, real X(N), the zeros.
%

%
%  Define the zero-th moment.
%
  zemu = r8_factorial ( m );
%
%  Define the Jacobi matrix.
%
  bj = zeros ( n, 1 );
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

  return
end
