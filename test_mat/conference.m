function a = conference ( n )

%*****************************************************************************80
%
%% CONFERENCE returns the CONFERENCE matrix.
%
%  Discussion:
%
%    A conference matrix is a square matrix A of order N, with a zero
%    diagonal, and only 1's and -1's on the offdiagonal, with the property
%    that:
%
%      A * A' = (N-1) * I.
%
%    The algorithm employed here is only valid when N - 1
%    is an odd prime, or a power of an odd prime.
%
%    Conference matrices have a relationship with Hadamard matrices:
%
%      If mod ( P, 4 ) == 3, A is antisymmetric, and
%        I+A is hadamard;
%      Else A is symmetric, and
%        ( I+A, -I+A )
%        (-I+A, -I-A) is Hadamard.
%
%  Example:
%
%    N = 8
%
%     0  1  1  1  1  1  1  1
%    -1  0 -1 -1  1 -1  1  1
%    -1  1  0 -1 -1  1 -1  1
%    -1  1  1  0 -1 -1  1 -1
%    -1 -1  1  1  0 -1 -1  1
%    -1  1 -1  1  1  0 -1 -1
%    -1 -1  1 -1  1  1  0 -1
%    -1 -1 -1  1 -1  1  1  0
%
%  Properties:
%
%    If N-1 is prime, then A[2:N,2:N] is a circulant matrix.
%
%    If N-1 = 1 mod 4, then A is symmetric.
%
%    If N-1 = 3 mod 4, then A is antisymmetric.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.  N-1 must be an odd prime,
%    or a power of an odd prime.
%
%    Output, real A(N,N), the matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == 1 & j == 1 )
        a(i,j) = 0.0;
      elseif ( i == 1 )
        a(i,j) = 1.0;
      elseif ( j == 1 )
        if ( mod ( ( n - 1 ), 4 ) == 1 )
          a(i,j) = 1.0;
        else
          a(i,j) = -1.0;
        end
      else
        a(i,j) = legendre_symbol ( i - j, n - 1 );
      end
    end
  end

  return
end
