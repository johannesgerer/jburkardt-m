function a = cheby_van2_inverse ( n )

%*****************************************************************************80
%
%% CHEBY_VAN2_INVERSE inverts the Chebyshev Vandermonde-like matrix.
%
%  Formula:
%
%    if ( I == 1 or N ) .and. ( J == 1 or N ) then
%      A(I,J) = ( 1 / (2*sqrt(N-1)) ) * cos ( (I-1) * (J-1) * PI / (N-1) )
%    else if ( I == 1 or N ) .or. ( J == 1 or N ) then
%      A(I,J) = ( 1 / (  sqrt(N-1)) ) * cos ( (I-1) * (J-1) * PI / (N-1) )
%    else
%      A(I,J) = ( 2 /    sqrt(N-1)  ) * cos ( (I-1) * (J-1) * PI / (N-1) )
%
%
%  Example:
%
%    N = 4
%
%                1/2    1             1           1/2
%    1/sqrt(3) *  1   2*COS(PI/3)   2*COS(2*PI/3)       COS(3*PI/3)
%                 1   2*COS(2*PI/3) 2*COS(4*PI/3)       COS(6*PI/3)
%                1/2    COS(3*PI/3)   COS(6*PI/3) 1/2 * COS(9*PI/3)
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
  for i = 1 : n
    for j = 1 : n

      angle = ( i - 1 ) * ( j - 1 ) * pi / ( n - 1 );

      a(i,j) = cos ( angle );

    end
  end

  a(1:n,1:n) = 2.0 * a(1:n,1:n) / sqrt ( n - 1 );

  a(1,1:n) = 0.5 * a(1,1:n);
  a(n,1:n) = 0.5 * a(n,1:n);

  a(1:n,1) = 0.5 * a(1:n,1);
  a(1:n,n) = 0.5 * a(1:n,n);

  return
end
