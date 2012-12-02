function a = grcar ( m, n, k )

%*****************************************************************************80
%
%% GRCAR returns the Grcar matrix.
%
%  Formula:
%
%    if ( I == J+1 )
%      A(I,J) = -1.0
%    elseif ( I <= J & J <= I+K )
%      A(I,J) = 1.0
%    else
%      A(I,J) = 0.0
%
%  Example:
%
%    M = 5, N = 5, K = 2
%
%     1  1  1  0  0
%    -1  1  1  1  0
%     0 -1  1  1  1
%     0  0 -1  1  1
%     0  0  0 -1  1
%
%  Rectangular Properties:
%
%    The diagonal and first K superdiagonals are 1, while the first
%    subdiagonal is -1.
%
%    A is banded, with bandwidth K+2.
%
%    A is integral: int ( A ) = A.
%
%    A is upper Hessenberg.
%
%    A is Toeplitz: constant along diagonals.
%
%  Square Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    The eigenvalues are sensitive.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joseph Grcar,
%    Operator coefficient methods for linear equations,
%    Technical Report SAND89-8691, 
%    Sandia National Laboratories, Albuquerque,
%    New Mexico, 1989 (Appendix 2).
%
%    NM Nachtigal, L Reichel, Lloyd Trefethen,
%    A hybrid GMRES algorithm for nonsymmetric linear systems,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 13, 1992, pages 796-825.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Input, integer K, the number of superdiagonals of 1's.  
%    K should be no greater than N-1.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m

    for j = 1 : n

      if ( i == j+1 )
        a(i,j) = -1.0;
      elseif ( i <= j & j <= i+k )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end

  end

  return
end
