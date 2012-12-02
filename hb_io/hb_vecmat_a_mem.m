function rhsval = hb_vecmat_a_mem ( nrow, ncol, nnzero, nrhs, colptr, rowind, ...
  values, exact )

%*****************************************************************************80
%
%% HB_VECMAT_A_MEM multiplies a vector times an assembled Harwell Boeing matrix.
%
%  Discussion:
%
%    In this "A_MEM" version of the routine, the matrix is assumed to be in
%    "assembled" form, and all the data is assumed to be small enough
%    to reside completely in memory; the matrix and multiplicand vectors
%    are assumed to have been read into memory before this routine is called.
%
%    It is assumed that MXTYPE(3:3) = 'A', that is, that the matrix is
%    stored in the "assembled" format.
%
%    Also, the storage used for the vectors X and the products A*X
%    corresponds to RHSTYP(1:1) = 'F', that is, the "full" storage mode
%    for vectors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Iain Duff, Roger Grimes, John Lewis,
%    User's Guide for the Harwell-Boeing Sparse Matrix Collection,
%    October 1992.
%
%  Parameters:
%
%    Input, integer NROW, the number of rows or variables.
%
%    Input, integer NCOL, the number of columns or elements.
%
%    Input, integer NNZERO.  In the case of assembled sparse matrices,
%    this is the number of nonzeroes.  
%
%    Input, integer NRHS, the number of right hand sides.
%
%    Input, integer COLPTR(NCOL+1), COLPTR(I) points to the location of
%    the first entry of column I in the sparse matrix structure.
%
%    Input, integer ROWIND(NNZERO), the row index of each item.
%
%    Input, real VALUES(NNZERO), the nonzero values of the matrix.
%
%    Input, real EXACT(NROW,NRHS), contains NRHS dense vectors.
%
%    Output, real RHSVAL(NCOL,NRHS), the product vectors A'*X.
%

%
%  Zero out the result vectors.
%
  rhsval(1:ncol,1:nrhs) = 0.0E+00;
%
%  For each column J of the matrix,
%
  for column = 1 : ncol
%
%  For nonzero entry K
%
    for k = colptr(column) : colptr(column+1)-1

      row = rowind(k);
%
%  For each right hand side vector:
%
%    B(J,1:NRHS) = B(J,1:NRHS) + X(I,1:NRHS) * A(I,J)
%
      rhsval(column,1:nrhs) = rhsval(column,1:nrhs) + values(k) * exact(row,1:nrhs);

    end

  end

  return
end
