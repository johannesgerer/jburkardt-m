function a = bis_inverse ( alpha, beta, n )

%*****************************************************************************80
%
%% BIS_INVERSE returns the inverse of a bidiagonal scalar matrix.
%
%  Formula:
%
%    if ( I <= J )
%      A(I,J) = (-BETA)**(J-I) / ALPHA**(J+1-I)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 7.0, BETA = 2.0, N = 4
%
%   1/7  -1/2   1/4  -1/8
%    0    1/7  -1/2   1/4
%    0     0    1/7  -1/2
%    0     0     0    1/7
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is upper triangular
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    det ( A ) = (1/ALPHA)**N.
%
%    LAMBDA(1:N) = 1 / ALPHA.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 April 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, the scalars which define the
%    diagonal and first superdiagonal of the matrix.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  if ( alpha == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BIS_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The input parameter ALPHA was 0.\n' );
    error ( 'BIS_INVERSE - Fatal error!' );
  end

  for i = 1 : n
    for j = 1 : n

      if ( i <= j )
        a(i,j) = ( -beta )^(j-i) / alpha^(j+1-i);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
