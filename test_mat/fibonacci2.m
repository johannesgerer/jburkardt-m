function a = fibonacci2 ( n )

%*****************************************************************************80
%
%% FIBONACCI2 returns the Fibonacci2 matrix.
%
%  Example:
%
%    N = 5
%
%    0 1 0 0 0
%    1 1 0 0 0
%    0 1 1 0 0
%    0 0 1 1 0
%    0 0 0 1 1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is tridiagonal.
%
%    Because A is tridiagonal, it has property A (bipartite).
%
%    A is banded, with bandwidth 3.
%
%    A is integral: int ( A ) = A.
%
%    A is a zero/one matrix.
%
%    If N = 1 then
%      det ( A ) = 0
%    else
%      det ( A ) = (-1)**(N-1)
%
%    If 1 < N, then A is unimodular.
%
%    For 2 <= N, A has the eigenvalues:
%
%      PHI   (once),
%      1     (N-2) times,
%      1-PHI (once).
%
%    When applied to a Fibonacci1 matrix B, the Fibonacci2 matrix
%    A produces the "next" Fibonacci1 matrix C = A*B.
%
%    Let PHI be the golden ratio (1+sqrt(5))/2.
%
%    For 2 <= N, the eigenvalues and eigenvectors are:
%
%    LAMBDA(1)     = PHI,     vector = (1,PHI,PHI^2,...PHI^(N-1));
%    LAMBDA(2:N-1) = 1        vector = (0,0,0,...,0,1);
%    LAMBDA(N)     = 1 - PHI. vector = ((-PHI)^(N-1),(-PHI)^(N-2),...,1)
%
%    Note that there is only one eigenvector corresponding to 1.
%    Hence, for 3 < N, the matrix is defective.  This fact means, 
%    for instance, that the convergence of the eigenvector in the power 
%    method will be very slow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      if ( i == 1 )

        if ( j == 2 )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end

      else

        if ( j == i-1 | j == i )
          a(i,j) = 1.0;
        else
          a(i,j) = 0.0;
        end

      end

    end
  end

  return
end
