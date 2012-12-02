function [ isym, row, col, b ] = r8gb_to_r8s3 ( m, n, ml, mu, a, nz_num )

%*****************************************************************************80
%
%% R8GB_TO_R8S3 copies a R8GB matrix to a R8S3 matrix.
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
%    The R8S3 storage format corresponds to the SLAP Triad format.
%
%    The R8S3 storage format stores the row, column and value of each nonzero
%    entry of a sparse matrix.  The entries may be given in any order.  No
%    check is made for the erroneous case in which a given matrix entry is
%    specified more than once.
%
%    There is a symmetry option for square matrices.  If the symmetric storage
%    option is used, the format specifies that only nonzeroes on the diagonal
%    and lower triangle are stored.  However, this routine makes no attempt
%    to enforce this.  The only thing it does is to "reflect" any nonzero
%    offdiagonal value.  Moreover, no check is made for the erroneous case
%    in which both A(I,J) and A(J,I) are specified, but with different values.
%
%    This routine reorders the entries of A so that the first N entries
%    are exactly the diagonal entries of the matrix, in order.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2006
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
%
%    Output, integer ISYM, is 0 if the matrix is not symmetric, and 1
%    if the matrix is symmetric.  If the matrix is symmetric, then
%    only the nonzeroes on the diagonal and in the lower triangle are stored.
%    For this routine, ISYM is always output 0.
%
%    Output, integer ROW(NZ_NUM), the row indices.
%
%    Output, integer COL(NZ_NUM), the column indices.
%
%    Output, real B(NZ_NUM), the R8S3 matrix.
%
  isym = 0;
  nz = 0;

  for i = 1 : m
    for j = 1 : n
      if ( i - ml <= j & j <= i + mu + ml )
        if ( a(ml+mu+1+i-j,j) ~= 0.0 )

          if ( nz_num <= nz )
            fprintf ( 1, '\n' );
            fprintf ( 1, 'R8GB_TO_R8S3 - Fatal error!\n' );
            fprintf ( 1, '  NZ_NUM = %8d\n', nz_num );
            fprintf ( 1, '  But the matrix has more nonzeros than that!\n' );
            error ( 'R8GB_TO_R8S3 - Fatal error!' );
          end

          nz = nz + 1;
          row(nz) = i;
          col(nz) = j;
          b(nz) = a(ml+mu+1+i-j,j);

        end
      end
    end
  end

  if ( nz < nz_num )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8GB_TO_R8S3 - Warning!\n' );
    fprintf ( 1, '  NZ_NUM = %8d\n', nz_num );
    fprintf ( 1, '  But the number of nonzeros is %8d\n', nz );
  end

  return
end
