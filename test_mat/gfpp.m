function a = gfpp ( n, alpha )

%*****************************************************************************80
%
%% GFPP returns the GFPP matrix.
%
%  Discussion:
%
%    The GFPP matrix has the maximal growth factor for Gauss elimination.
%
%  Formula:
%
%    if ( I = J or J = N )
%      A(I,J) = 1.0
%    elseif ( J < I )
%      A(I,J) = - abs ( ALPHA )
%    else
%      A(I,J) = 0
%
%  Example:
%
%    N = 5, ALPHA = 1
%
%    A =
%
%    1     0     0     0     1
%   -1     1     0     0     1
%   -1    -1     1     0     1
%   -1    -1    -1     1     1
%   -1    -1    -1    -1     1
%
%    P = Identity
%
%    L =
%
%    1     0     0     0     0
%   -1     1     0     0     0
%   -1    -1     1     0     0
%   -1    -1    -1     1     0
%   -1    -1    -1    -1     1
%
%    U =
%
%    1     0     0     0     1
%    0     1     0     0     2
%    0     0     1     0     4
%    0     0     0     1     8
%    0     0     0     0    16
%
%  Properties:
%
%    A is generally not symmetric: A' /= A.
%
%    If ALPHA is between 0 and 1, then Gaussian elimination with partial
%    pivoting yields a controllable growth factor of (1+ALPHA)^(N-1).
%    and a P factor which is the identity, an L factor equal to the lower
%    triangle of A, and an U factor which is equal to the identity matrix,
%    except that the last column is
%
%      [ 1, ALPHA+1, (ALPHA+1)^2, ...(ALPHA+1)^N-1 ].
%
%    If ALPHA is not between 0 and 1, then Gauss elimination WITHOUT
%    pivoting will yield the same pivot growth factor and PLU factorization
%    just described, but Gauss elimination with partial pivoting will not.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Nicholas Higham, Desmond Higham,
%    Large growth factors in Gaussian elimination with pivoting,
%    SIAM Journal on Matrix Analysis and Applications,
%    Volume 10, 1989, pages 155-164.
%
%    Lloyd Trefethen, David Bau,
%    Numerical Linear Algebra,
%    SIAM, 1997, pages 165-166.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, determines subdiagonal elements.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    for j = 1 : n

      if ( i == j | j == n )
        a(i,j) = 1.0;
      elseif ( j < i )
        a(i,j) = - abs ( alpha );
      else
        a(i,j) = 0.0;
      end

    end
  end

  return
end
