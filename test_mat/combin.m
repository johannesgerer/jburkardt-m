function a = combin ( alpha, beta, n )

%*****************************************************************************80
%
%% COMBIN returns the COMBIN matrix.
%
%  Formula:
%
%    If ( I = J ) then
%      A(I,J) = ALPHA + BETA
%    else
%      A(I,J) = BETA
%
%  Example:
%
%    N = 5, ALPHA = 2, BETA = 3
%
%    5 3 3 3 3
%    3 5 3 3 3
%    3 3 5 3 3
%    3 3 3 5 3
%    3 3 3 3 5
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    det ( A ) = ALPHA^(N-1) * ( ALPHA + N * BETA ).
%
%    LAMBDA(1:N-1) = ALPHA,
%    LAMBDA(N) = ALPHA + N * BETA.
%
%    The eigenvector associated with LAMBDA(N) is (1,1,1,...,1)/sqrt(N).
%
%    The other N-1 eigenvectors are simply any (orthonormal) basis
%    for the space perpendicular to (1,1,1,...,1).
%
%    A is nonsingular if ALPHA /= 0.0 and ALPHA + N * BETA /= 0.
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 3.25,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, New York, 1969, page 53,
%    LC: QA263.G68.
%
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 1, Fundamental Algorithms, Second Edition,
%    Addison-Wesley, Reading, Massachusetts, 1973, page 36.
%
%  Parameters:
%
%    Input, real ALPHA, BETA, scalars that define A.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a(1:n,1:n) = beta;

  for i = 1 :n
    a(i,i) = a(i:i) + alpha;
  end
 
  return
end
