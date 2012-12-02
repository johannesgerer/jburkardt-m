function a = cheby_van2 ( n )

%*****************************************************************************80
%
%% CHEBY_VAN2 returns the Chebyshev Vandermonde-like matrix.
%
%  Discussion:
%
%    The formula for this matrix has been slightly modified, by a scaling
%    factor, in order to make it closer to its inverse.
%
%  Formula:
%
%    A(I,J) = ( 1 / sqrt ( N - 1 ) ) * cos ( (I-1) * (J-1) * PI / (N-1) )
%
%  Example:
%
%    N = 4
%
%                 1      1           1           1
%    1/sqrt(3) *  1  COS(PI/3)   COS(2*PI/3) COS(3*PI/3)
%                 1  COS(2*PI/3) COS(4*PI/3) COS(6*PI/3)
%                 1  COS(3*PI/3) COS(6*PI/3) COS(9*PI/3)
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    The entries of A are based on the extrema of the Chebyshev
%    polynomial T(n-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2007
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
  if ( n == 1 )
    a(1,1) = 1.0;
    return
  end
    
  for i = 1 : n
    for j = 1 : n

      angle = ( ( i - 1 ) * ( j - 1 ) ) * pi / ( n - 1 );

      a(i,j) = cos ( angle );

    end
  end

  a(1:n,1:n) = a(1:n,1:n) / sqrt ( n - 1 );

  return
end
