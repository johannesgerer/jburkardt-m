function [ x, w ] = moment_method ( n, moment )

%*****************************************************************************80
%
%% MOMENT_METHOD computes a quadrature rule by the method of moments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, John Welsch,
%    Calculation of Gaussian Quadrature Rules,
%    Mathematics of Computation,
%    Volume 23, Number 106, April 1969, pages 221-230.
%
%  Parameters:
%
%    Input, integer N, the order of the quadrature rule.
%
%    Input, real MOMENT(2*N+1), moments 0 through 2*N.
%
%    Output, real X(N,1), W(N,1), the points and weights of the quadrature rule.
%
  debug = 0;

  if ( debug )
    r8vec_print ( 2 * n + 1, moment, '  Moments:' );
  end
%
%  Define the N+1 by N+1 Hankel matrix H(I,J) = moment(I+J).
%
  h = zeros ( n + 1, n + 1 );
  for i = 1 : n + 1
    for j = 1 : n + 1
      h(i,j) = moment(i+j-1);
    end
  end

  if ( debug )
    r8mat_print ( n + 1, n + 1, h, '  Hankel matrix:' )
  end
%
%  Compute R, the upper triangular Cholesky factor of H.
%
  r = chol ( h );

  if ( debug )
    r8mat_print ( n + 1, n + 1, r, '  Cholesky factor:' )
  end
%
%  Compute ALPHA and BETA from R, using Golub and Welsch's formula.
%
  alpha = zeros ( n, 1 );
  alpha(1) = r(1,2) / r(1,1);
  for i = 2 : n
    alpha(i) = r(i,i+1) / r(i,i) - r(i-1,i) / r(i-1,i-1);
  end

  beta = zeros ( n - 1, 1 );
  for i = 1 : n - 1
    beta(i) = r(i+1,i+1) / r(i,i);
  end
%
%  Compute the points and weights from the moments.
%
  jacobi = diag ( alpha, 0 ) + diag ( beta, -1 ) + diag ( beta, +1 );

  if ( debug )
    r8mat_print ( n, n, jacobi, '  Jacobi matrix: ' );
  end
%
%  Get the eigendecomposition of the Jacobi matrix.
%
  [ evec, eval ] = eig ( jacobi );

  x = diag ( eval );
  w = moment(1) * evec(1,:).^2;
%
%  Destroy all row vectors.
%
  x = x(:);
  w = w(:);

  return
end

