function a = orth_symm ( n )

%*****************************************************************************80
%
%% ORTH_SYMM returns an orthogonal symmetric matrix.
%
%  Formula:
%
%    A(I,J) = sqrt ( 2 ) * sin ( I * J * pi / ( N + 1 ) ) / sqrt ( N + 1 )
%
%  Example:
%
%    N = 5
%
%    0.326019   0.548529   0.596885   0.455734   0.169891
%    0.548529   0.455734  -0.169891  -0.596885  -0.326019
%    0.596885  -0.169891  -0.548529   0.326019   0.455734
%    0.455734  -0.596885   0.326019   0.169891  -0.548528
%    0.169891  -0.326019   0.455734  -0.548528   0.596885
%
%  Properties:
%
%    A is orthogonal: A' * A = A * A' = I.
%
%    A is symmetric: A' = A.
%
%    A is not positive definite (unless N = 1 ).
%
%    Because A is symmetric, it is normal.
%
%    Because A is symmetric, its eigenvalues are real.
%
%    Because A is orthogonal, its eigenvalues have unit norm.
%
%    Only +1 and -1 can be eigenvalues of A.
%
%    Because A is normal, it is diagonalizable.
%
%    A is involutional: A * A = I.
%
%    If N is even, trace ( A ) = 0; if N is odd, trace ( A ) = 1.
%
%    LAMBDA(1:(N+1)/2) = 1; LAMBDA((N+1)/2+1:N) = -1.
%
%    A is the left and right eigenvector matrix for the
%    second difference matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Morris Newman, John Todd,
%    The evaluation of matrix inversion programs,
%    Journal of the Society for Industrial and Applied Mathematics,
%    Volume 6, Number 4, pages 466-476, 1958.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n

      angle = 2.0 * ( i * j ) * pi / ( 2 * n + 1 );
      a(i,j) = 2.0 * sin ( angle ) / sqrt ( ( 2 * n + 1 ) );

    end
  end

  return
end
