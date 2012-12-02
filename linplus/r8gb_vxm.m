function b = r8gb_vxm ( m, n, ml, mu, a, x )

%*****************************************************************************80
%
%% R8GB_VXM multiplies a vector by a R8GB matrix.
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
%    LINPACK and LAPACK storage of general band matrices requires
%    an extra ML upper diagonals for possible fill in entries during
%    Gauss elimination.  This routine does not access any entries
%    in the fill in diagonals, because it assumes that the matrix
%    has NOT had Gauss elimination applied to it.  If the matrix
%    has been Gauss eliminated, then the routine R8GB_MU must be
%    used instead.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 November 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than min(M,N)-1.
%
%    Input, real A(2*ML+MU+1,N), the R8GB matrix.
%
%    Input, real X(M), the vector to be multiplied by A.
%
%    Output, real B(N), the product X*A.
%
  b(1:n) = 0.0;

  for j = 1 : n
    ilo = max ( 1, j - mu );
    ihi = min ( m, j + ml );
    for i = ilo : ihi
      b(j) = b(j) + x(i) * a(i-j+ml+mu+1,j);
    end
  end

  return
end
