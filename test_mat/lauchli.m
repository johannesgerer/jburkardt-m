function a = lauchli ( alpha, m, n )

%*****************************************************************************80
%
%% LAUCHLI returns the LAUCHLI matrix.
%
%  Discussion:
%
%    The Lauchli matrix is of order M by N, with M = N + 1.
%
%    This matrix is a well-known example in least squares that indicates
%    the danger of forming the matrix of the normal equations,  A' * A.
%
%    A common value for ALPHA is sqrt(EPS) where EPS is the machine epsilon.
%
%  Formula:
%
%    if ( I = 1 )
%      A(I,J) = 1
%    else if ( I-1 = J )
%      A(I,J) = ALPHA
%    else
%      A(I,J) = 0
%
%  Example:
%
%    M = 5, N = 4
%    ALPHA = 2
%
%    1  1  1  1
%    2  0  0  0
%    0  2  0  0
%    0  0  2  0
%    0  0  0  2
%
%  Properties:
%
%    The matrix is singular in a simple way.  The first row is
%    equal to the sum of the other rows, divided by ALPHA.
%
%    if ( ALPHA /= 0 )
%      rank ( A ) = N - 1
%    else if ( ALPHA == 0 )
%      rank ( A ) = 1
%
%    The family of matrices is nested as a function of N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Peter Lauchli,
%    Jordan-Elimination und Ausgleichung nach kleinsten Quadraten,
%    (Jordan elimination and smoothing by least squares),
%    Numerische Mathematik,
%    Volume 3, Number 1, December 1961, pages 226-240.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining the matrix.
%
%    Input, integer M, N, the order of A.  It should be the case
%    that M = N + 1.
%
%    Output, real A(M,N), the matrix.
%
  a = zeros ( m, n );

  for i = 1 : m
    for j = 1 : n

      if ( i == 1 )
        a(i,j) = 1.0;
      elseif ( i == j + 1 )
        a(i,j) = alpha;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
