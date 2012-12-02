function b = r8po_ml ( n, r, x )

%*****************************************************************************80
%
%% R8PO_ML computes A * x = b after A has been factored by R8PO_FA.
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
%    19 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real R(N,N), the Cholesky factor, in R8GE format, returned by R8PO_FA.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%

%
%  Compute R * x = y.
%
  for i = 1 : n
    b(i) = r(i,i) * x(i);
    for j = i + 1 : n
      b(i) = b(i) + r(i,j) * x(j);
    end
  end
%
%  Compute R' * y = b.
%
  for i = n : -1 : 1
    b(i) = r(i,i) * b(i);
    for j = 1 : i-1
      b(i) = b(i) + b(j) * r(j,i);
    end
  end

  return
end
