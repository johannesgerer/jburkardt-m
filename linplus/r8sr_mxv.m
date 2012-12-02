function b = r8sr_mxv ( n, nz, row, col, diag, off, x )

%*****************************************************************************80
%
%% R8SR_MXV multiplies a R8SR matrix times a vector.
%
%  Discussion:
%
%    The R8SR storage format stores the diagonal of a sparse matrix in DIAG.
%    The off-diagonal entries of row I are stored in entries ROW(I)
%    through ROW(I+1)-1 of OFF.  COL(J) records the column index
%    of the entry in A(J).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, integer NZ, the number of offdiagonal nonzero elements in A.
%
%    Input, integer ROW(N+1).  The nonzero offdiagonal elements of row I of A
%    are contained in A(ROW(I)) through A(ROW(I+1)-1).
%
%    Input, integer COL(NZ), contains the column index of the element
%    in the corresponding position in A.
%
%    Input, real DIAG(N), the diagonal elements of A.
%
%    Input, real OFF(NZ), the off-diagonal elements of A.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * X.
%
  b(1:n) = diag(1:n) .* x(1:n);

  for i = 1 : n
    for k = row(i) : row(i+1)-1
      j = col(k);
      b(i) = b(i) + off(k) * x(j);
    end
  end

  return
end
