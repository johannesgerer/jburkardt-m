function a = cheby_van3 ( n )

%*****************************************************************************80
%
%% CHEBY_VAN3 returns the CHEBY_VAN3 matrix
%
%  Formula:
%
%    A(I,J) = cos ( (I-1) * (J-1/2) * PI / N )
%
%  Example:
%
%    N = 4
%
%        1            1           1            1
%    COS(  PI/8)  COS(3*PI/8) COS( 5*PI/8) COS( 7*PI/8)
%    COS(2*PI/8)  COS(6*PI/8) COS(10*PI/8) COS(14*PI/8)
%    COS(3*PI/8)  COS(9*PI/8) COS(15*PI/8) COS(21*PI/8)
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is "almost" orthogonal.  A * A' = a diagonal matrix.
%
%    The entries of A are based on the zeros of the Chebyshev polynomial T(n).
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
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      angle = ( i - 1 ) * ( 2 * j - 1 ) * pi / ( 2 * n );

      a(i,j) = cos ( angle );

    end
  end

  return
end
