function a = clement2_inverse ( n, x, y )

%*****************************************************************************80
%
%% CLEMENT2_INVERSE returns the inverse of the CLEMENT2 matrix.
%
%  Example:
%
%    N = 6, X and Y arbitrary:
%
%     0                1/Y1 0         -X2/(Y1*Y3) 0   X2*X4/(Y1*Y3*Y5)
%     1/X1             0    0          0          0    0
%     0                0    0          1/Y3       0   -X4/(Y3*Y5)
%    -Y2/(X1*X3)       0    1/X3       0          0    0
%     0                0    0          0          0    1/Y5
%     Y2*Y4/(X1*X3*X5) 0   -Y4/(X3*X5) 0          1/X5 0
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
%    Input, integer N, the order of A.  N must not be odd%
%
%    Input, real X(N-1), Y(N-1), the first super and
%    subdiagonals of the matrix A.  None of the entries
%    of X or Y may be zero.
%
%    Output, real A(N,N), the matrix.
%
  if ( mod ( n, 2 ) == 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CLEMENT2_INVERSE - Fatal error!\n' );
    fprintf ( 1,'  The matrix is singular for odd N.\n' );
    error ( 'CLEMENT2_INVERSE - Fatal error!' );
  end

  for i = 1 : n-1

    if ( x(i) == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CLEMENT2_INVERSE - Fatal error!\n' );
      fprintf ( 1, '  The matrix is singular\n' );
      fprintf ( 1, '  X(I) = 0 for I = %d\n', i );
      error ( 'CLEMENT2_INVERSE - Fatal error!' );
    elseif ( y(i) == 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CLEMENT2_INVERSE - Fatal error!\n' );
      fprintf ( 1, '  The matrix is singular\n' );
      fprintf ( 1, '  Y(I) = 0 for I = %d\n', i );
      error ( 'CLEMENT2_INVERSE - Fatal error!' );
    end

  end

  a = zeros ( n, n );

  for i = 1 : n

    if ( mod ( i, 2 ) == 1 )

      for j = i : 2 : n-1

        if ( j == i )
          prod1 = 1.0 / y(j);
          prod2 = 1.0 / x(j);
        else
          prod1 = - prod1 * x(j-1) / y(j);
          prod2 = - prod2 * y(j-1) / x(j);
        end

        a(i,j+1) = prod1;
        a(j+1,i) = prod2;

      end

    end

  end
  
  return
end

