function a = pei_inverse ( alpha, n )

%*****************************************************************************80
%
%% PEI_INVERSE returns the inverse of the PEI matrix.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = (ALPHA+N-1) / ( (ALPHA+1)*(ALPHA+N-1)-(N-1) )
%    else
%      A(I,J) =          -1 / ( (ALPHA+1)*(ALPHA+N-1)-(N-1) )
%
%  Example:
%
%    ALPHA = 2, N = 5
%
%            6 -1 -1 -1 -1
%           -1  6 -1 -1 -1
%    1/14 * -1 -1  6 -1 -1
%           -1 -1 -1  6 -1
%           -1 -1 -1 -1  6
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is a "combinatorial" matrix.  See routine COMBIN.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is a circulant matrix: each row is shifted once to get the next row.
%
%    A has constant row sum.
%
%    Because it has a constant row sum of 1 / ( ALPHA + N ),
%    A has an eigenvalue of 1 / ( ALPHA + N ), and
%    a (right) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    A has constant column sum.
%
%    Because it has constant column sum of 1 / ( ALPHA + N ),
%    A has an eigenvalue of 1 / ( ALPHA + N ), and
%    a (left) eigenvector of ( 1, 1, 1, ..., 1 ).
%
%    The eigenvalues of A are
%      LAMBDA(1:N-1) = 1 / ALPHA
%      LAMBDA(N) = 1 / ( ALPHA + N )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    ML Pei,
%    A test matrix for inversion procedures,
%    Communications of the ACM,
%    Volume 5, 1962, page 508.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar that defines the inverse 
%    of the Pei matrix.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  bottom = ( alpha + 1.0 ) * ( alpha + n - 1.0 ) - n + 1.0;

  if ( bottom == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PEI_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The matrix is not invertible.\n' );
    fprintf ( 1, '  (ALPHA+1)*(ALPHA+N-1)-N+1 is zero.\n' );
    error ( 'PEI_INVERSE - Fatal error!' );
  end

  alpha1 = ( alpha + ( n ) - 1.0 ) / bottom;
  beta1 = - 1.0 / bottom;

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = alpha1;
      else
        a(i,j) = beta1;
      end

    end
  end

  return
end
