function [ diag, off, seed ] = r8sr_random ( n, nz, row, col, seed )

%*****************************************************************************80
%
%% R8SR_RANDOM randomizes a R8SR matrix.
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
%    16 February 2005
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real DIAG(N), the diagonal elements of A.
%
%    Output, real OFF(NZ), the off-diagonal elements of A.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for i = 1 : n
    [ diag(i), seed ] = r8_uniform_01 ( seed );
    for j = row(i) : row(i+1)-1
      [ off(j), seed ] = r8_uniform_01 ( seed );
    end
  end

  return
end
