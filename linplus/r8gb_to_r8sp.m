function [ row, col, b ] = r8gb_to_r8sp ( m, n, ml, mu, a, nz_num )

%*****************************************************************************80
%
%% R8GB_TO_R8SP copies a R8GB matrix to a R8SP matrix.
%
%  Discussion:
%
%    The R8GB storage format is for an M by N banded matrix, with lower 
%    bandwidth ML and upper bandwidth MU.  Storage includes room for ML 
%    extra superdiagonals, which may be required to store nonzero entries 
%    generated during Gaussian elimination.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.  
%
%    LINPACK and LAPACK band storage requires that an extra ML
%    superdiagonals be supplied to allow for fillin during Gauss
%    elimination.  Even though a band matrix is described as
%    having an upper bandwidth of MU, it effectively has an
%    upper bandwidth of MU+ML.  This routine will copy nonzero
%    values it finds in these extra bands, so that both unfactored
%    and factored matrices can be handled.
%
%    The R8SP storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.
%
%    It is possible that a pair of indices (I,J) may occur more than
%    once.  Presumably, in this case, the intent is that the actual value
%    of A(I,J) is the sum of all such entries.  This is not a good thing
%    to do, but I seem to have come across this in MATLAB.
%
%    The R8SP format is used by CSPARSE ("sparse triplet"), DLAP/SLAP 
%    ("nonsymmetric SLAP triad"), by MATLAB, and by SPARSEKIT ("COO" format).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrices.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrices.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths of A1.
%    ML and MU must be nonnegative, and no greater than min(M,N)-1.
%
%    Input, real A(2*ML+MU+1,N), the R8GB matrix.
%
%    Input, integer NZ_NUM, the number of nonzero entries in A.
%    This number can be obtained by calling R8GB_NZ_NUM.
%
%    Output, integer ROW(NZ_NUM), the row indices.
%
%    Output, integer COL(NZ_NUM), the column indices.
%
%    Output, real B(NZ_NUM), the R8SP matrix.
%
  nz = 0;

  for i = 1 : m

    jlo = max ( 1, i - ml );
    jhi = min ( n, i + mu + ml );

    for j = jlo : jhi

      if ( a(ml+mu+1+i-j,j) == 0.0 )
        continue;
      end

      if ( nz_num <= nz )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R8GB_TO_R8SP - Fatal error!\n' );
        fprintf ( 1, '  NZ_NUM = %d\n', nz_num );
        fprintf ( 1, '  But the matrix has more nonzeros than that!\n' );
        error ( 'R8GB_TO_DS3 - Fatal error!' );
      end

      nz = nz + 1;
      row(nz) = i;
      col(nz) = j;
      b(nz) = a(ml+mu+1+i-j,j);

    end
  end

  if ( nz < nz_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8GB_TO_R8SP - Warning!\n' );
    fprintf ( 1, '  NZ_NUM = %d\n', nz_num );
    fprintf ( 1, '  But the number of nonzeros is %d\n', nz );
  end

  return
end
