function det = r8gb_det ( n, ml, mu, a_lu, pivot )

%*****************************************************************************80
%
%% R8GB_DET computes the determinant of a matrix factored by R8GB_FA or R8GB_TRF.
%
%  Discussion:
%
%    An M by N banded matrix A with lower bandwidth ML and upper bandwidth MU
%    is assumed to be entirely zero, except for the main diagonal, and
%    entries in the ML nearest subdiagonals, and MU nearest superdiagonals.
%
%    LINPACK and LAPACK "R8GB" storage for such a matrix generally includes
%    room for ML extra superdiagonals, which may be required to store
%    nonzero entries generated during Gaussian elimination.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Anderson, Bai, Bischof, Demmel, Dongarra, Du Croz, Greenbaum,
%    Hammarling, McKenney, Ostrouchov, Sorensen,
%    LAPACK User's Guide,
%    Second Edition,
%    SIAM, 1995.
%
%    Dongarra, Bunch, Moler, Stewart,
%    LINPACK User's Guide,
%    SIAM, 1979.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A_LU(2*ML+MU+1,N), the LU factors from R8GB_FA or R8GB_TRF.
%
%    Input, integer PIVOT(N), the pivot vector, as computed by R8GB_FA
%    or R8GB_TRF.
%
%    Output, real DET, the determinant of the matrix.
%
  det = 1.0;

  for j = 1 : n
    det = det * a_lu(ml+mu+1,j);
  end

  for i = 1 : n
    if ( pivot(i) ~= i )
      det = -det;
    end
  end

  return
end
