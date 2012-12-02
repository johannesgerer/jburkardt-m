function a = lotkin ( m, n )

%*****************************************************************************80
%
%% LOTKIN returns the Lotkin matrix.
%
%  Formula:
%
%    if ( I = 1 )
%      A(I,J) = 1
%    else
%      A(I,J) = 1 / ( I + J - 1 )
%
%  Example:
%
%    N = 5
%
%     1   1   1   1   1
%    1/2 1/3 1/4 1/5 1/6
%    1/3 1/4 1/5 1/6 1/7
%    1/4 1/5 1/6 1/7 1/8
%    1/5 1/6 1/7 1/8 1/9
%
%  Properties:
%
%    A is the Hilbert matrix with the first row set to all 1's.
%
%    A is generally not symmetric: A' /= A.
%
%    A is ill-conditioned.
%
%    A has many negative eigenvalues of small magnitude.
%
%    The inverse of A has all integer elements, and is known explicitly.
%
%    For N = 6, the eigenvalues are:
%       2.132376,
%      -0.2214068,
%      -0.3184330 D-1,
%      -0.8983233 D-3,
%      -0.1706278 D-4,
%      -0.1394499 D-6.
%
%    det ( A(N) ) = ( -1 )**(N-1) / DELTA(N)
%
%    where
%
%      DELTA(N) = COMB ( 2*N-2, N-2 ) * COMB ( 2*N-2, N-1 )
%        * ( 2*N-1) * DELTA(N-1),
%      DELTA(1) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Gregory, David Karney,
%    Example 3.9,
%    A Collection of Matrices for Testing Computational Algorithms,
%    Wiley, 1969, page 38,
%    LC: QA263.G68.
%
%    Max Lotkin,
%    A set of test matrices,
%    Mathematics Tables and Other Aids to Computation,
%    Volume 9, 1955, pages 153-161.
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%  Parameters:
%
%    Input, integer M, N, the number of rows and columns of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m
    for j = 1 : n

      if ( i == 1 )
        a(i,j) = 1.0;
      else
        a(i,j) = 1.0 / ( i + j - 1 );
      end

    end
  end

  return
end
