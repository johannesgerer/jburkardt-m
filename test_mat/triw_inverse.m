function a = triw_inverse ( alpha, k, n )

%*****************************************************************************80
%
%% TRIW_INVERSE sets the inverse of the TRIW matrix.
%
%  Example:
%
%    ALPHA = 3, K = 2, N = 5
%
%    1      -3       6      -9       9
%    0       1      -3       6      -9
%    0       0       1      -3       6
%    0       0       0       1      -3
%    0       0       0       0       1
%
%  Properties:
%
%    A is nonsingular.
%
%    A is upper triangular.
%
%    A is Toeplitz: constant along diagonals.
%
%    A is persymmetric: A(I,J) = A(N+1-J,N+1-I).
%
%    det ( A ) = 1.
%
%    A is unimodular.
%
%    LAMBDA(1:N) = 1.
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
%  Parameters:
%
%    Input, real ALPHA, value used on the superdiagonals.
%
%    Input, integer K, the number of nonzero superdiagonals.
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  a = zeros ( n, n );

  for i = 1 : n
    a(i,i) = 1.0;
  end
%
%  Compute the product of row 1 of the inverse with columns 2,
%  3,..., N of the original matrix, up to, but not including,
%  the next unknown entry of the inverse.  That unknown entry
%  is multiplied by 1, and the resulting sum must be zero.
%  So the unknown entry equals minus the sum of all the
%  other products.  And all the entries along its superdiagonal
%  have the same value.
%
  for j = 2 : n

    prod = 0.0;
    klo = max ( 1, j - k );
    for kk = klo : j - 1
      prod = prod + a(1,kk) * alpha;
    end

    for i = 1 : n - j + 1
      a(i,i+j-1) = - prod;
    end

  end

  return
end
