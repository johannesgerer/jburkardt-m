function a = householder ( n, x )

%*****************************************************************************80
%
%% HOUSEHOLDER constructs a HOUSEHOLDER matrix.
%
%  Discussion:
%
%    A Householder matrix is also called an elementary reflector.
%
%  Formula:
%
%     A = I - ( 2 * X * X' ) / ( X' * X )
%
%  Example:
%
%    N = 5, X = ( 1, 1, 1, 0, -1 )
%
%   1/2 -1/2 -1/2  0  1/2
%  -1/2  1/2 -1/2  0  1/2
%  -1/2 -1/2  1/2  0  1/2
%    0    0    0   1   0
%   1/2  1/2  1/2  0  1/2
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is orthogonal: A' * A = A * A' = I.
%
%    inverse ( A ) = A.
%
%    det ( A ) = -1.
%
%    A is unimodular.
%
%    If Y and Z are nonzero vectors of equal length, and
%      X = ( Y - Z ) / NORM(Y-Z),
%    then
%      A * Y = Z.
%
%    A represents a reflection through the plane which
%    is perpendicular to the vector X.  In particular, A*X = -X.
%
%    LAMBDA(1) = -1;
%    LAMBDA(2:N) = +1.
%
%    If X is the vector used to define H, then X is the eigenvector
%    associated with the eigenvalue -1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, Charles Van Loan,
%    Matrix Computations, second edition,
%    Johns Hopkins University Press, Baltimore, Maryland, 1989.
%
%    Pete Stewart,
%    Introduction to Matrix Computations,
%    Academic Press, 1973,
%
%    James Wilkinson,
%    The Algebraic Eigenvalue Problem,
%    Oxford University Press, 1965.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the vector that defines the 
%    Householder matrix.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = 0.0;
  for i = 1 : n
    a(i,i) = 1.0;
  end

  xdot = x(1:n) * x(1:n)';

  if ( 0.0 < xdot )

    for i = 1 : n
      for j = 1 : n
        a(i,j) = a(i,j) - 2.0 * x(i) * x(j) / xdot;
      end
    end

  end

  return
end
