function c = r8po_mxm ( n, a, b )

%*****************************************************************************80
%
%% R8PO_MXM multiplies two R8PO matrices.
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
%    Input, integer N, the order of the matrices.
%    N must be positive.
%
%    Input, real A(N,N), B(N,N), the R8PO factor matrices.
%
%    Output, real C(N,N), the R8PO product matrix.
%
  c = zeros ( n, n );
  
  for i = 1 : n

    c(i,1:i-1) = 0.0E+00;

    for j = i : n
      for k = 1 : n

        if ( i <= k )
          aik = a(i,k);
        else
          aik = a(k,i);
        end

        if ( k <= j )
          bkj = b(k,j);
        else
          bkj = b(j,k);
        end

        c(i,j) = c(i,j) + aik * bkj;

      end
    end

  end

  return
end
