function a = line_adj_inverse ( n )

%*****************************************************************************80
%
%% LINE_ADJ_INVERSE returns the inverse of the LINE_ADJ matrix.
%
%  Example:
%
%    N = 6:
%
%     0     1     0    -1     0     1
%     1     0     0     0     0     0
%     0     0     0     1     0    -1
%    -1     0     1     0     0     0
%     0     0     0     0     0     1
%     1     0    -1     0     1     0
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
    fprintf ( 1, 'LINE_ADJ_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The matrix is singular for odd N.\n' );
    error ( 'LINE_ADJ_INVERSE - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : n

    if ( mod ( i, 2 ) == 1 )

      for j = i : 2 : n - 1

        if ( j == i )
          p = 1.0;
        else
          p = - p;
        end

        a(i,j+1) = p;
        a(j+1,i) = p;

      end

    end

  end

  return
end
