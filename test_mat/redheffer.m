function a = redheffer ( n )

%*****************************************************************************80
%
%% REDHEFFER returns the Redheffer matrix.
%
%  Formula:
%
%    if ( J = 1 or mod ( J, I ) == 0 )
%      A(I,J) = 1
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5
%
%     1  1  1  1  1
%     1  1  0  1  0
%     1  0  1  0  0
%     1  0  0  1  0
%     1  0  0  0  1
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    The diagonal entries of A are all 1.
%
%    A is a zero/one matrix.
%
%    N - int ( log2 ( N ) ) - 1 eigenvalues are equal to 1.
%
%    There is a real eigenvalue of magnitude approximately sqrt ( N ),
%    which is the spectral radius of the matrix.
%
%    There is a negative eigenvalue of value approximately -sqrt ( N ).
%
%    The remaining eigenvalues are "small", and there is a conjecture
%    that they lie inside the unit circle in the complex plane.
%
%    The determinant is equal to the Mertens function M(N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Wayne Barrett, Tyler Jarvis,
%    Spectral Properties of a Matrix of Redheffer,
%    Linear Algebra and Applications,
%    Volume 162, 1992, pages 673-683.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n

    for j = 1 : n

      if ( j == 1 | mod ( j, i ) == 0 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end

  end

  return
end
