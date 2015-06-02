function a = sylvester_kac_inverse ( n )

%*****************************************************************************80
%
%% SYLVESTER_KAC_INVERSE returns the inverse of the SYLVESTER_KAC matrix.
%
%  Example:
%
%    N = 6:
%
%      0     1/5    0  -2/15  0   8/15
%      1      0     0    0    0    0
%      0      0     0   1/3   0  -4/3
%    -4/3     0    1/3   0    0    0
%      0      0     0    0    0    1
%     8/15    0   -2/15  0   1/5   0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 April 2015
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
  if ( mod ( n, 2 ) == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SYLVESTER_KAC_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The matrix is singular for odd N.\n' );
    error ( 'SYLVESTER_KAC_INVERSE - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : n

    if ( mod ( i, 2 ) == 1 )

      for j = i : 2 : n-1

        if ( j == i )
          p1 = 1.0 / ( n - j );
          p2 = 1.0 /       j;
        else
          p1 = - p1 * (     j - 1 ) / ( n - j );
          p2 = - p2 * ( n - j + 1 ) /       j;
        end

        a(i,j+1) = p1;
        a(j+1,i) = p2;

      end

    end

  end

  return
end
