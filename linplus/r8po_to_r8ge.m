function b = r8po_to_r8ge ( n, a )

%*****************************************************************************80
%
%% R8PO_TO_R8GE copies a R8PO matrix to a R8GE matrix.
%
%  Discussion:
%
%    The R8PO storage format is appropriate for a symmetric positive definite 
%    matrix and its inverse.  (The Cholesky factor of an R8PO matrix is an
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
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A(N,N), the R8PO matrix.
%
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i <= j )
        b(i,j) = a(i,j);
      else
        b(i,j) = a(j,i);
      end
    end
  end

  return
end
