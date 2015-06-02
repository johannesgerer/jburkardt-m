function a = companion ( n, x )

%*****************************************************************************80
%
%% COMPANION returns the COMPANION matrix.
%
%  Formula:
%
%    Let the monic N-th degree polynomial be defined by
%
%      P(t) = t^N + X(N)*t^(N-1) + X(N-1)*t^(N-2) + ... + X(2)*t + X(1)
%
%    Then
%
%      A(1,J) = X(N+1-J) for J=1 to N
%      A(I,I-1) = 1      for I=2 to N
%      A(I,J) = 0        otherwise
%
%    A is called the companion matrix of the polynomial P(t), and the
%    characteristic equation of A is P(t) = 0.
%
%    Matrices of this form are also called Frobenius matrices.
%
%    The determinant of a matrix is unaffected by being transposed,
%    and only possibly changes sign if the rows are "reflected", so
%    there are actually many possible ways to write a companion matrix:
%
%    A B C D  A 1 0 0  0 1 0 0  0 0 1 0  0 0 1 A
%    1 0 0 0  B 0 1 0  0 0 1 0  0 1 0 0  0 1 0 B
%    0 1 0 0  C 0 0 1  0 0 0 1  1 0 0 0  1 0 0 C
%    0 0 1 0  D 0 0 0  D C B A  A B C D  0 0 0 D
%
%  Example:
%
%    N = 5, X = ( 1, 2, 3, 4, 5 )
%
%    5 4 3 2 1
%    1 0 0 0 0
%    0 1 0 0 0
%    0 0 1 0 0
%    0 0 0 1 0
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is nonsingular if and only if X(1) is nonzero.
%
%    The eigenvalues of A are the roots of P(t) = 0.
%
%    If LAMBDA is an eigenvalue of A, then a corresponding eigenvector is
%      ( 1, LAMBDA, LAMBDA^2, ..., LAMBDA^(N-1) ).
%
%    If LAMBDA is an eigenvalue of multiplicity 2, then a second 
%    corresponding generalized eigenvector is
%
%      ( 0, 1, 2 * LAMBDA, ..., (N-1)*LAMBDA^(N-2) ).
%
%    For higher multiplicities, repeatedly differentiate with respect to LAMBDA.
%
%    Any matrix with characteristic polynomial P(t) is similar to A.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gene Golub, Charles Van Loan,
%    Matrix Computations, second edition,
%    Johns Hopkins University Press, Baltimore, Maryland, 1989,
%    section 7.4.6.
%
%    Charles Kenney, Alan Laub,
%    Controllability and stability radii for companion form systems,
%    Math. Control Signals Systems, 1 (1988), pages 239-256.
%    (Gives explicit formulas for the singular values.)
%
%    James Wilkinson,
%    The Algebraic Eigenvalue Problem,
%    Oxford University Press,
%    1965, page 12.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the coefficients of the polynomial 
%    which define A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == 1 )
        a(i,j) = x(n+1-j);
      elseif ( i == j + 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
