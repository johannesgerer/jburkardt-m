function a = clement1_inverse ( n )

%*****************************************************************************80
%
%% CLEMENT1_INVERSE returns the inverse of the Clement1 matrix.
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
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Paul Clement,
%    A class of triple-diagonal matrices for test purposes,
%    SIAM Review,
%    Volume 1, 1959, pages 50-52.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  if ( mod ( n, 2 ) == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CLEMENT1_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The Clement matrix is singular for odd N.\n' );
    error ( 'CLEMENT1_INVERSE - Fatal error!' );
  end

  a(1:n,1:n) = 0.0;

  for i = 1 : n

    if ( mod ( i, 2 ) == 1 )

      for j = i : 2 : n-1

        if ( j == i )
          prod1 = 1.0 / ( n - j );
          prod2 = 1.0 /       j;
        else
          prod1 = - prod1 * (     j - 1 ) / ( n - j );
          prod2 = - prod2 * ( n - j + 1 ) /       j;
        end

        a(i,j+1) = prod1;
        a(j+1,i) = prod2;

      end

    end

  end

  return
end
