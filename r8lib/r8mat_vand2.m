function a = r8mat_vand2 ( n, x )

%*****************************************************************************80
%
%% R8MAT_VAND2 returns the N by N row Vandermonde matrix A.
%
%  Discussion:
%
%    The row Vandermonde matrix returned by this routine reads "across"
%    rather than down.  In particular, each row begins with a 1, followed by
%    some value X, followed by successive powers of X.
%
%  Formula:
%
%    A(I,J) = X(I)**(J-1)
%
%  Properties:
%
%    A is nonsingular if, and only if, the X values are distinct.
%
%    The determinant of A is
%
%      det(A) = product ( 2 <= I <= N ) (
%        product ( 1 <= J <= I-1 ) ( ( X(I) - X(J) ) ) ).
%
%    The matrix A is generally ill-conditioned.
%
%  Example:
%
%    N = 5, X = (2, 3, 4, 5, 6)
%
%    1 2  4   8   16
%    1 3  9  27   81
%    1 4 16  64  256
%    1 5 25 125  625
%    1 6 36 216 1296
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix desired.
%
%    Input, real X(N), the values that define A.
%
%    Output, real A(N,N), the N by N row Vandermonde matrix.
%
  a = zeros ( n, n );
  
  for i = 1 : n
    for j = 1 : n

      if ( j == 1 && x(i) == 0.0 )
        a(i,j) = 1.0;
      else
        a(i,j) = x(i).^(j-1);
      end

    end
  end

  return
end
