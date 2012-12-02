function [ diag, off ] = r8sr_indicator ( n, nz, row, col )

%*****************************************************************************80
%
%% R8SR_INDICATOR sets up a R8SR indicator matrix.
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
%    Output, real DIAG(N), the diagonal elements of A.
%
%    Output, real OFF(NZ), the off-diagonal elements of A.
%
  fac = 10 ^ ( i4_log_10 ( n ) + 1 );

  for i = 1 : n

    j = i;
    diag(i) = fac * i + j;

    for k = row(i) : row(i+1)-1
      j = col(k);
      off(k) = fac * i + j;
    end

  end

  return
end
