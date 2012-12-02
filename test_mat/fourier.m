function a = fourier ( n )

%*****************************************************************************80
%
%% FOURIER returns the Fourier matrix.
%
%  Discussion:
%
%    Multiplication of a vector of data by A is equivalent to
%    computing the discrete Fourier transform of the data.  Multiplication by
%    the Hermitian (complex-conjugate-transpose) of A is equivalent
%    to computing the inverse discrete Fourier transform.
%
%  Formula:
%
%    A(I,J) = exp ( 2 * PI * sqrt ( -1 ) * (I-1) * (J-1) / N ) / sqrt ( N )
%
%    or
%
%      A(I,J) = W**((I-1)*(J-1)) / sqrt(N)
%
%    where W is the N-th root of unity.
%
%  Example:
%
%    N = 3
%
%                 1  1  1
%    1/sqrt(3) *  1  J  K
%                 1  K  J
%
%    where
%
%      J = EXP(2*PI*EYE/3) = cos ( 2*PI/3 ) + EYE * sin ( 2 * PI / 3 )
%      K = EXP(4*PI*EYE/3) = cos ( 4*PI/3 ) + EYE * sin ( 4 * PI / 3 )
%
%    or, using the root of unity form, with W = the fourth root of unity,
%
%    N = 4
%
%                1  1     1     1            1  1   1   1
%                1  W     W**2  W**3         1  W  -1  -W
%    1/sqrt(4) * 1  W**2  W**4  W**6 = 1/2 * 1 -1   1  -1
%                1  W**3  W**6  W**9         1 -W  -1   W
%
%  Properties:
%
%    A is complex.
%
%    A is symmetric: A' = A.
%
%    A is unitary, that is, the inverse of A is the complex
%    conjugate of A: INVERSE(A) = CONJUGATE(A)
%
%    The fourth power of A is the identity, that is, A*A*A*A = I.
%
%    A is a Vandermonde matrix based on the N roots of unity, scaled
%    by sqrt(N).
%
%    A is the eigenvector matrix of any circulant matrix.
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
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, complex A(N,N), the Fourier matrix.
%
  complex_i = complex ( 0.0, 1.0 );
  
  for i = 1 : n
    for j = 1 : n

      angle = 2.0 * pi * ( i - 1 ) * ( j - 1 ) / n;

      a(i,j) = exp ( complex_i * angle ) / sqrt ( n );

    end
  end

  return
end
