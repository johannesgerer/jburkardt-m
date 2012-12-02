function b = r8sr_to_r8ge ( n, nz, row, col, diag, off )

%*****************************************************************************80
%
%% R8SR_TO_R8GE converts a R8SR matrix to a R8GE matrix.
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
%    Output, real B(N,N), the R8GE matrix.
%
  if ( n <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8SR_TO_R8GE - Fatal error!\n' );
    fprintf ( 1, '  N is less than or equal to zero, N = %d\n', n );
    error ( 'R8SR_TO_R8GE - Fatal error!' );
  end

  b(1:n,1:n) = 0.0E+00;

  for i = 1 : n
    b(i,i) = diag(i);
  end

  for i = 1 : n
    for j = row(i) : row(i+1)-1
      b(i,col(j)) = off(j);
    end
  end

  return
end
