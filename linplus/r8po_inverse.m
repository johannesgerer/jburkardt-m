function b = r8po_inverse ( n, r )

%*****************************************************************************80
%
%% R8PO_INVERSE computes the inverse of a matrix factored by R8PO_FA.
%
%  Discussion:
%
%    The R8PO storage format is appropriate for a symmetric positive definite 
%    matrix and its inverse.  (The Cholesky factor of a R8PO matrix is an
%    upper triangular matrix, so it will be in R8GE storage format.)
%
%    Only the diagonal and upper triangle of the square array are used.
%    This same storage scheme is used when the matrix is factored by
%    R8PO_FA, or inverted by R8PO_INVERSE.  For clarity, the lower triangle
%    is set to zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 February 2004
%
%  Author:
%
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real R(N,N), the Cholesky factor, in R8GE storage, returned by R8PO_FA.
%
%    Output, real B(N,N), the inverse matrix, in R8PO storage.
%
  b(1:n,1:n) = r(1:n,1:n);
%
%  Compute Inverse ( R ).
%
  for k = 1 : n

    b(k,k) = 1.0E+00 / b(k,k);
    b(1:k-1,k) = -b(1:k-1,k) * b(k,k);

    for j = k + 1 : n
      t = b(k,j);
      b(k,j) = 0.0E+00;
      b(1:k,j) = b(1:k,j) + t * b(1:k,k);
    end

  end
%
%  Compute Inverse ( R ) * ( Inverse ( R ) )'.
%
  for j = 1 : n

    for k = 1 : j - 1
      t = b(k,j);
      b(1:k,k) = b(1:k,k) + t * b(1:k,j);
    end

    b(1:j,j) = b(1:j,j) * b(j,j);

  end

  return
end
