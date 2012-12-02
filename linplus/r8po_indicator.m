function a = r8po_indicator ( n )

%*****************************************************************************80
%
%% R8PO_INDICATOR sets up a R8PO indicator matrix.
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
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of rows and columns of the matrix.
%    N must be positive.
%
%    Output, real A(N,N), the R8PO matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  for i = 1 : n
    for j = 1 : i-1
      a(i,j) = 0.0;
    end
    for j = i : n
      a(i,j) = fac * i + j;
    end
  end

  return
end
