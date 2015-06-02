function a = dorr ( alpha, n )

%*****************************************************************************80
%
%% DORR returns the DORR matrix.
%
%  Formula:
%
%    if ( I <= (N+1) / 2 )
%
%      if ( J = I - 1 )
%        A(I,J) = - ALPHA * (N+1)^2
%      else if ( J = I )
%        A(I,J) = 2 * ALPHA * (N+1)^2 + 0.5 * (N+1) - I
%      else if ( J = I + 1 )
%        A(I,J) = - ALPHA * (N+1)^2 - 0.5 * (N+1) + I
%      else
%        A(I,J) = 0
%
%    else
%
%      if ( J = I - 1 )
%        A(I,J) = - ALPHA * (N+1)^2 + 0.5 * (N+1) - I
%      else if ( J = I )
%        A(I,J) = 2 * ALPHA * (N+1)^2 - 0.5 * (N+1) + I
%      else if ( J = I + 1 )
%        A(I,J) = - ALPHA * (N+1)^2
%      else
%        A(I,J) = 0
%
%  Example:
%
%    ALPHA = 7, N = 5
%
%     506 -254    0    0    0
%    -252  505 -253    0    0
%       0 -252  504 -252    0
%       0    0 -253  505 -252
%       0    0    0 -254  506
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is row diagonally dominant, since the absolute value of the diagonal
%    entry always equals ( or exceeds, I = 1 and N ) the sum of the
%    absolute values of the two off diagonal row entries.
%
%    A is irreducibly diagonally dominant, and hence nonsingular.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    A is an M matrix.
%
%    0 < INVERSE(A).
%
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%    A is symmetrizable.  There is a positive definite diagonal matrix
%    D so that INVERSE(D)*A*D is symmetric.
%
%    The eigenvalues of A are positive, so the matrix
%    INVERSE(D)*A*D is positive definite.
%
%    The Gauss-Seidel and Jacobi iterative methods for solving
%    A*x = b both converge.  Furthermore, if RHO(GS) is the
%    spectral radius of the Gauss-Seidel iteration matrix, and
%    RHO(J) the spectral radius of the Jacobi iteration matrix,
%    then RHO(GS) = RHO(J)^2 < 1.
%
%    A is ill-conditioned for small values of ALPHA.  The
%    test case used N = 100, and ALPHA=0.01, 0.003, 0.001 and
%    1.0D-10.  The matrix A was already very ill-conditioned for
%    ALPHA = 0.003, with the minimum eigenvalue being 1.8D-12, and
%    the maximum one being 199.87.
%
%    The columns of INVERSE(A) vary greatly in norm.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Fred Dorr,
%    An example of ill-conditioning in the numerical solution of
%    singular perturbation problems,
%    Mathematics of Computation,
%    Volume 25, Number 114, 1971, pages 271-283.
%
%  Parameters:
%
%    Input, real ALPHA, scalar that defines the matrix.
%    A typical value of ALPHA is 0.01.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i <= floor ( ( n + 1 ) / 2 ) )

        if ( j == i - 1 )
          a(i,j) = - alpha * ( n + 1 )^2;
        elseif ( j == i )
          a(i,j) = 2.0 * alpha * ( n + 1 )^2 + 0.5 * ( n + 1 ) - i;
        elseif ( j == i + 1 )
          a(i,j) = - alpha * ( n + 1 )^2 - 0.5 * ( n + 1 ) + i;
        else
          a(i,j) = 0.0;
        end

      else

        if ( j == i - 1 )
          a(i,j) = - alpha * ( n + 1 )^2 + 0.5 * ( n + 1 ) - i;
        elseif ( j == i )
          a(i,j) = 2.0 * alpha * ( n + 1 )^2 - 0.5 * ( n + 1 ) + i;
        elseif ( j == i + 1 )
          a(i,j) = - alpha * ( n + 1 )^2;
        else
          a(i,j) = 0.0;
        end

      end

    end
  end

  return
end
