function a = rutis4 ( n )

%*****************************************************************************80
%
%% RUTIS4 returns the RUTIS4 matrix.
%
%  Example:
%
%    N = 6
%
%    14 14  6  1  0  0
%    14 20 15  6  1  0
%     6 15 20 15  6  1
%     1  6 15 20 15  6
%     0  1  6 15 20 14
%     0  0  1  6 14 14
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is banded with a bandwidth of 7.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    A is the cube of the scalar tridiagonal matrix whose diagonals
%    are ( 1, 2, 1 ).
%
%    LAMBDA(I) = 64 * ( cos ( i * pi / ( 2 * ( n + 1 ) ) ) )^6
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n

    if ( 1 <= i - 3 )
      a(i,i-3) = 1.0;
    end

    if ( 1 <= i - 2 )
      a(i,i-2) = 6.0;
    end

    if ( 1 <= i - 1 )
      a(i,i-1) = 15.0;
    end

    a(i,i) = 20.0;

    if ( i + 1 <= n )
      a(i,i+1) = 15.0;
    end

    if ( i + 2 <= n )
      a(i,i+2) = 6.0;
    end

    if ( i + 3 <= n )
      a(i,i+3) = 1.0;
    end


  end

  a(1,1) = 14.0;
  a(1,2) = 14.0;
  a(2,1) = 14.0;

  a(n,n) = 14.0;
  a(n-1,n) = 14.0;
  a(n,n-1) = 14.0;

  return
end
