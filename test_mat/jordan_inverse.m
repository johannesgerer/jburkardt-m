function a = jordan_inverse ( alpha, n )

%*****************************************************************************80
%
%% JORDAN_INVERSE returns the inverse of the Jordan block matrix.
%
%  Formula:
%
%    if ( I <= J )
%      A(I,J) =  -1 * (-1/ALPHA)**(J+1-I)
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 2, N = 4
%
%    1/2 -1/4  1/8 -1/16
%    0    1/2 -1/4  1/8
%    0    0    1/2 -1/4
%    0    0    0    1/2
%
%  Properties:
%
%    A is upper triangular.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is generally not symmetric: A' /= A.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    The inverse of A is the Jordan block matrix, whose diagonal
%    entries are ALPHA, whose first superdiagonal entries are 1,
%    with all other entries zero.
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
%    13 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the eigenvalue of A.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  if ( alpha == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JORDAN_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The input parameter ALPHA was 0.\n' );
    error ( 'JORDAN_INVERSE - Fatal error!' );
  end

  for i = 1 : n
    for j = 1 : n

      if ( i <= j )
        a(i,j) =  - ( - 1.0 / alpha )^(j+1-i);
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
