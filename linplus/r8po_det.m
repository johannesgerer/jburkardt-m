function det = r8po_det ( n, a_lu )

%*****************************************************************************80
%
%% R8PO_DET computes the determinant of a matrix factored by R8PO_FA.
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
%    25 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real A_LU(N,N), the LU factors from R8PO_FA.
%
%    Output, real DET, the determinant of A.
%
  det = 1.0E+00;

  for i = 1 : n
    det = det * a_lu(i,i);
  end

  return
end
