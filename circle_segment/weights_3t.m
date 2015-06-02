function w = weights_3t ( t, a, b )

%*****************************************************************************80
%
%% WEIGHTS_3T: Gauss quadrature weights from 3 term recurrence coefficients.
%
%  Discussion:
%
%    This computation produces the weights for a quadrature rule, given
%    the nodes and the coefficients of the 3-term recurrence relation
%    for the corresponding orthogonal polynomials.
%
%  Modified:
%
%    09 January 2014
%
%  Author:
%
%    Gerard Meurant, Alvise Sommariva
%
%  Reference:
%
%    Gerard Meurant, Alvise Sommariva,
%    Fast variants of the Golub and Welsch algorithm for symmetric
%    weight functions.
%
%  Parameters:
%
%    Input, real T(N), the nodes, the eigenvalues of the Jacobi matrix.
%
%    Input, real A(N-1), B(N-1), the coefficients of the 3-term recurrence,
%    which represent (most of) the diagonal of the Jacobi matrix, and the
%    immediate super- and sub-diagonals of the Jacobi matrix.
%
%    Output, real W(N), the squares of the first components of the 
%    eigenvectors of the Jacobi matrix.
%

%
%  Destroy all row vectors!
%
  t = t ( : );

  n = length ( t );

  p = zeros ( n, n );
  p(1,1:n) = ones ( 1, n );
  p(2,1:n) = ( t(1:n,1)' - a(1) ) / b(1);

  for k = 3 : n
    k1 = k - 1;
    k2 = k - 2;
    p(k,1:n) = ( ( t(1:n,1)' - a(k1) ) .* p(k1,1:n) - b(k2) * p(k2,1:n) ) ...
      / b(k1);
  end

  p2(1:n,1:n) = p(1:n,1:n) .* p(1:n,1:n);

  w(1,1:n) = 1.0 ./ sum ( p2(1:n,1:n) );

  return
end
