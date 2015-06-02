function a = hanowa ( alpha, n )

%*****************************************************************************80
%
%% HANOWA returns the HANOWA matrix.
%
%  Formula:
%
%    If ( I = J )
%      A(I,J) = ALPHA
%    else if ( I <= N/2 and J = I+N/2 )
%      A(I,J) = -I
%    else if ( N/2 < I and J = I-N/2 )
%      A(I,J) = I-N/2
%    else
%      A(I,J) = 0
%
%  Example:
%
%    ALPHA = 17, N = 6
%
%    17  0  0 -1  0  0
%     0 17  0  0 -2  0
%     0  0 17  0  0 -3
%     1  0  0 17  0  0
%     0  2  0  0 17  0
%     0  0  3  0  0 17
%
%  Properties:
%
%    A is generally not symmetric: A' ~= A.
%
%    A is nonsingular.
%
%    A is antisymmetric: A' = -A.
%
%    Because A is antisymmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A has complex eigenvalues
%
%      LAMBDA(2*I-1) = ALPHA + I * sqrt ( -1 )
%      LAMBDA(2*I)   = ALPHA - I * sqrt ( -1 )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    E Hairer, SP Norsett, G Wanner,
%    Solving Ordinary Differential Equations I: Nonstiff Problems,
%    Springer Verlag, Berlin, 1987, pages 86-87.
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining the Hanowa matrix.  A
%    typical value is -1.0.
%
%    Input, integer N, the order of A.  N must be even.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HANOWA - Fatal error!\n' );
    fprintf ( 1, '  Input N = %d\n', n );
    fprintf ( 1, '  but N must be a multiple of 2.\n' );
    error ( 'HANOWA - Fatal error!' );
  end

  for i = 1 : n
    for j = 1 : n

      if ( i == j )
        a(i,j) = alpha;
      elseif ( i <= floor ( n / 2 ) & j == i + floor ( n / 2 ) )
        a(i,j) = - i;
      elseif ( floor ( n / 2 ) < i & j == i - floor ( n / 2 ) )
        a(i,j) = floor ( i - n / 2 );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
