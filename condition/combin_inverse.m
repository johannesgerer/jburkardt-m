function a = combin_inverse ( alpha, beta, n )

%*****************************************************************************80
%
%% COMBIN_INVERSE returns the inverse of the combinatorial matrix A.
%
%  Formula:
%
%    if ( I = J )
%      A(I,J) = (ALPHA+(N-1)*BETA) / (ALPHA*(ALPHA+N*BETA))
%    else
%      A(I,J) =             - BETA / (ALPHA*(ALPHA+N*BETA))
%
%  Example:
%
%    N = 5, ALPHA = 2, BETA = 3
%
%           14 -3 -3 -3 -3
%           -3 14 -3 -3 -3
%   1/34 *  -3 -3 14 -3 -3
%           -3 -3 -3 14 -3
%           -3 -3 -3 -3 14
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
%    A is Toeplitz: constant along diagonals.
%
%    det ( A ) = 1 / (ALPHA**(N-1) * (ALPHA+N*BETA)).
%
%    A is well defined if ALPHA /= 0D+00 and ALPHA+N*BETA /= 0.
%
%    A is also a combinatorial matrix.
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
%  Reference:
%
%    Donald Knuth,
%    The Art of Computer Programming,
%    Volume 1, Fundamental Algorithms, Second Edition,
%    Addison-Wesley, Reading, Massachusetts, 1973, page 36.
%
%  Parameters:
%
%    Input, real ALPHA, BETA, scalars that define the matrix.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  if ( alpha == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMBIN_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The entries of the matrix are undefined\n' );
    fprintf ( 1, '  because ALPHA = 0.\n' );
    error ( 'COMBIN_INVERSE - Fatal error!' );
  elseif ( alpha + n * beta == 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'COMBIN_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The entries of the matrix are undefined\n' );
    fprintf ( 1, '  because ALPHA+N*BETA is zero.\n' );
    error ( 'COMBIN_INVERSE - Fatal error!' );
  end

  bot = alpha * ( alpha + n * beta );

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = ( alpha + ( n - 1 ) * beta ) / bot;
      else
        a(i,j) = - beta / bot;
      end

    end
  end

  return
end
