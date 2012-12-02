function a = clement2_inverse ( n )

%*****************************************************************************80
%
%% CLEMENT2_INVERSE returns the inverse of the Clement2 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.  N must not be odd%
%
%    Output, real A(N,N), the matrix.
%
  if ( mod ( n, 2 ) == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CLEMENT2_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The Clement matrix is singular for odd N.\n' );
    error ( 'CLEMENT2_INVERSE - Fatal error!' );
  end

  a(1:n,1:n) = 0.0;

  for i = 1 : n

    if ( mod ( i, 2 ) == 1 )

      for j = i : 2 : n-1

        if ( j == i )
          prod = 1.0 / sqrt ( ( j * ( n - j ) ) );
        else
          prod = - prod ...
            * sqrt ( ( j - 1 ) * ( n + 1 - j ) ) ...
            / sqrt ( j * ( n - j ) );
        end

        a(i,j+1) = prod;
        a(j+1,i) = prod;

      end

    end

  end

  return
end
