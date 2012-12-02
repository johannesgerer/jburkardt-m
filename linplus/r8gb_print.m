function r8gb_print ( m, n, ml, mu, a, title )

%*****************************************************************************80
%
%% R8GB_PRINT prints a banded matrix.
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
%    07 April 2006
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
%    ML and MU must be nonnegative, and no greater than min(M,N)-1..
%
%    Input, real A(2*ML+MU+1,N), the M by N band matrix, stored in LINPACK
%    or LAPACK general band storage mode.
%
%    Input, string TITLE, a title to be printed.
%
  r8gb_print_some ( m, n, ml, mu, a, 1, 1, m, n, title );

  return
end
