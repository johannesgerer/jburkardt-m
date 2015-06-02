function a = unitary_random ( n, key )

%*****************************************************************************80
%
%% UNITARY_RANDOM returns the UNITARY_RANDOM matrix.
%
%  Properties:
%
%    The inverse of A is equal to A^H.
%
%    A is unitary: A * A^H  = A^H * A = I.
%
%    Because A is unitary, it is normal: A^H * A = A * A^H.
%
%    Columns and rows of A have unit Euclidean norm.
%
%    Distinct pairs of columns of A are complex orthogonal.
%
%    Distinct pairs of rows of A are complex orthogonal.
%
%    The L2 vector norm of A*x = the L2 vector norm of x for any vector x.
%
%    The L2 matrix norm of A*B = the L2 matrix norm of B for any matrix B.
%
%    det ( A ) = +1 or -1.
%
%    A is unimodular.
%
%    All the eigenvalues of A have modulus 1.
%
%    All singular values of A are 1.
%
%    Every entry of A is no greater than 1 in complex absolute value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Pete Stewart,
%    Efficient Generation of Random Orthogonal Matrices With an Application
%    to Condition Estimators,
%    SIAM Journal on Numerical Analysis,
%    Volume 17, Number 3, June 1980, pages 403-409.
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, integer KEY, a positive value that selects the data.
%
%    Output, complex A(N,N), the matrix.
%
  a = zeros ( n, n );
%
%  Start with A = the identity matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i == j )
        a(i,j) = 1.0;
      else
        a(i,j) = 0.0;
      end
    end
  end
%
%  Now behave as though we were computing the QR factorization of
%  some other random matrix.  Generate the N elements of the first column,
%  compute the Householder matrix H1 that annihilates the subdiagonal elements,
%  and set A := A * conjg ( H1 ) = A * H.
%
%  On the second step, generate the lower N-1 elements of the second column,
%  compute the Householder matrix H2 that annihilates them,
%  and set A := A * conjg ( H2 ) = A * H2 = H1 * H2.
%
%  On the N-1 step, generate the lower 2 elements of column N-1,
%  compute the Householder matrix HN-1 that annihilates them, and
%  and set A := A * conjg ( H(N-1) ) = A * H(N-1) = H1 * H2 * ... * H(N-1).
%  This is our random unitary matrix.
%
  seed = key;

  for j = 1 : n - 1
%
%  Set the vector that represents the J-th column to be annihilated.
%
    x = zeros ( n, 1 );

    for i = j : n
      [ x(i,1), seed ] = c8_normal_01 ( seed );
    end
%
%  Compute the vector V that defines a Householder transformation matrix
%  H(V) that annihilates the subdiagonal elements of X.
%
    v = c8vec_house_column ( n, x, j );
%
%  Postmultiply the matrix A by conjg ( H(V) ) = H(V).
%
    a = c8mat_house_axh ( n, a, v );

  end

  return
end
