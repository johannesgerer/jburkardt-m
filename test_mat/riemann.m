function a = riemann ( m, n )

%*****************************************************************************80
%
%% RIEMANN returns the Riemann matrix.
%
%  Formula:
%
%    if ( I + 1 divides J + 1 evenly )
%      A(I,J) = I
%    else
%      A(I,J) = -1
%
%  Example:
%
%    M = 5, N = 5
%
%     1 -1  1 -1  1
%    -1  2 -1 -1  2
%    -1 -1  3 -1 -1
%    -1 -1 -1  4 -1
%    -1 -1 -1 -1  5
%
%  Discussion:
%
%    The Riemann hypothesis is true if and only if the determinant of A
%    is of order (N% * N**(-.5 + epsilon)) for every positive epsilon.
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    The strict lower triangular entries are all -1.
%
%    If A is square, then each eigenvalue LAMBDA(I) satisfies
%      abs ( LAMBDA(I) ) <= (N+1) - 1 / (N+1),
%    and eigenvalue LAMBDA(I) satisfies
%      1 <= LAMBDA(I) <= I + 1
%    except for at most (N+1) - sqrt ( N + 1 ) values, and
%    all integers in the interval ( (N+1)/3, (N+1)/2 ] are eigenvalues.
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
%    Friedrich Roesler,
%    Riemann's hypothesis as an eigenvalue problem,
%    Linear Algebra and Applications,
%    Volume 81, 1986, pages 153-198.
%
%  Parameters:
%
%    Input, integer M, N, the order of A.
%
%    Output, real A(M,N), the matrix.
%
  for i = 1 : m

    for j = 1 : n

      if ( mod ( j + 1, i + 1 ) == 0 )
        a(i,j) = i;
      else
        a(i,j) = - 1.0;
      end

    end

  end

  return
end
