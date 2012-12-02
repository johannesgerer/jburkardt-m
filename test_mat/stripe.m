function a = stripe ( n )

%*****************************************************************************80
%
%% STRIPE returns the STRIPE matrix.
%
%  Example:
%
%    N = 7
%
%    5  2  1  1  .  .  .
%    2  6  3  1  1  .  .
%    1  3  6  3  1  1  .
%    1  1  3  6  3  1  1
%    .  1  1  3  6  3  1
%    .  .  1  1  3  6  2
%    .  .  .  1  1  2  5
%
%  Properties:
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is symmetric: A' = A.
%
%    A is banded, with bandwidth 7.
%
%    A is centrosymmetric: A(I,J) = A(N+1-I,N+1-J).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 October 2007
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
  for i = 1 : n
    for j = 1 : n

           if ( j == i - 3 )
        a(i,j) = 1.0;
      elseif ( j == i - 2 )
        a(i,j) = 1.0;
      elseif ( j == i - 1 )
        if ( j == 1 | j == n - 1 )
          a(i,j) = 2.0;
        else
          a(i,j) = 3.0;
        end
      elseif ( j == i )
        if ( i == 1 | i == n )
          a(i,j) = 5.0;
        else
          a(i,j) = 6.0;
        end
      elseif ( j == i + 1 )
        if ( j == 2 | j == n )
          a(i,j) = 2.0;
        else
          a(i,j) = 3.0;
        end
      elseif ( j == i + 2 )
        a(i,j) = 1.0;
      elseif ( j == i + 3 )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
