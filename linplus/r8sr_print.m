function r8sr_print ( n, nz, row, col, diag, off, title )

%*****************************************************************************80
%
%%  R8SR_PRINT prints a R8SR matrix.
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
%    07 April 2006
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
%    Input, string TITLE, a title.
%
  r8sr_print_some ( n, nz, row, col, diag, off, 1, 1, n, n, title );

  return
end
