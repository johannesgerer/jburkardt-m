function b = r8ge_to_r8gb ( m, n, ml, mu, a )

%*****************************************************************************80
%
%% R8GE_TO_R8GB copies a R8GE matrix to a R8GB matrix.
%
%  Discussion:
%
%    It usually doesn't make sense to try to store a general matrix
%    in a band matrix format.  You can always do it, but it will take
%    more space, unless the general matrix is actually banded.
%
%    The purpose of this routine is to allow a user to set up a
%    banded matrix in the easy-to-use general format, and have this
%    routine take care of the compression of the data into general
%    format.  All the user has to do is specify the bandwidths.
%
%    Note that this routine "believes" what the user says about the
%    bandwidth.  It will assume that all entries in the general matrix
%    outside of the bandwidth are zero.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically 2*ML+MU+1 by N.
%
%    The R8GB storage format is for an M by N banded matrix, with lower
%    bandwidth ML and upper bandwidth MU.  Storage includes room for ML
%    extra superdiagonals, which may be required to store nonzero entries
%    generated during Gaussian elimination.
%
%    LINPACK and LAPACK band storage requires that an extra ML
%    superdiagonals be supplied to allow for fillin during Gauss
%    elimination.  Even though a band matrix is described as
%    having an upper bandwidth of MU, it effectively has an
%    upper bandwidth of MU+ML.  This routine will copy nonzero
%    values it finds in these extra bands, so that both unfactored
%    and factored matrices can be handled.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 March 2005
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
%    Input, integer M, the number of rows of the matrices.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrices.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths of the matrix.
%    ML and MU must be nonnegative, and no greater than min(M,N)-1.
%
%    Input, real A(M,N), the R8GE matrix.
%
%    Output, real B(2*ML+MU+1,N), the R8GB matrix.
%
  b = zeros ( 2*ml+mu+1, n );

  for i = 1 : m
    jlo = max ( i - ml, 1 );
    jhi = min ( i + mu, n );
    for j = jlo : jhi
      b(ml+mu+1+i-j,j) = a(i,j);
    end
  end

  return
end
