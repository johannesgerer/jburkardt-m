function a = jacobi_inverse ( n )

%*****************************************************************************80
%
%% JACOBI_INVERSE returns the inverse of the JACOBI matrix.
%
%  Discussion:
%
%    This inverse is related to that of the CLEMENT2 matrix.
%
%  Example:
%
%    N = 6
%
%         0    1.7321         0   -1.7638         0    1.7689
%    1.7321         0         0         0         0         0
%         0         0         0    1.9720         0   -1.9777
%   -1.7638         0    1.9720         0         0         0
%         0         0         0         0         0    1.9900
%    1.7689         0   -1.9777         0    1.9900         0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be even.
%
%    Output, real A(N,N), the matrix.
%
  if ( mod ( n, 2 ) == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'JACOBI_INVERSE - Fatal error!\n' );
    fprintf ( 1, '  The Jacobi matrix is singular for odd N.\n' );
    error ( 'JACOBI_INVERSE - Fatal error!' );
  end

  a = zeros ( n, n );

  for i = 1 : n

    if ( mod ( i, 2 ) == 1 )

      p = 1.0;

      for j = i : 2 : n - 1

        a1 = 0.5 * sqrt ( ( 4 * j * j ) / ( 4 * j * j - 1 ) );
        a2 = 0.5 * sqrt ( ( 4 * ( j - 1 ) * ( j - 1 ) ) ...
                        / ( 4 * ( j - 1 ) * ( j - 1 ) - 1 ) );
        if ( j == i )
          p = p / a1;
        else
          p = - p * a2 / a1;
        end

        a(i,j+1) = p;
        a(j+1,i) = p;

      end

    end

  end

  return
end
