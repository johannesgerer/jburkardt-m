function a = oto_inverse ( n )

%*****************************************************************************80
%
%% OTO_INVERSE returns the inverse of the OTO matrix.
%
%  Formula:
%
%    if ( I <= J )
%      A(I,J) = (-1)^(I+J) * I * (N-J+1) / (N+1)
%    else
%      A(I,J) = (-1)^(I+J) * J * (N-I+1) / (N+1)
%
%  Example:
%
%    N = 4
%
%             4 -3  2 -1
%    (1/5) * -3  6 -4  2
%             2 -4  6 -3
%            -1  2 -3  4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 November 2007
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
      if ( i <= j )
        a(i,j) = ( -1 )^(i+j) * ( i * ( n - j + 1 ) ) / ( n + 1 );
      else
        a(i,j) = ( -1 )^(i+j) * ( j * ( n - i + 1 ) ) / ( n + 1 );
      end
    end
  end

  return
end
