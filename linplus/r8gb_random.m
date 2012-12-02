function [ a, seed ] = r8gb_random ( m, n, ml, mu, seed )

%*****************************************************************************80
%
%% R8GB_RANDOM randomizes a R8GB matrix.
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
%    LINPACK and LAPACK band storage requires that an extra ML
%    superdiagonals be supplied to allow for fillin during Gauss
%    elimination.  Even though a band matrix is described as
%    having an upper bandwidth of MU, it effectively has an
%    upper bandwidth of MU+ML.  This routine assumes it is setting
%    up an unfactored matrix, so it only uses the first MU upper bands,
%    and does not place nonzero values in the fillin bands.
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
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than min(M,N)-1.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(2*ML+MU+1,N), the R8GB matrix.
%
%    Output, integer SEED, the updated seed for the random number generator.
%
  for j = 1 : n
    for irow = 1 : 2*ml+mu+1
      i = irow + j - ml - mu - 1;
      if ( ml < irow & 1 <= i & i <= m )
        [ r, seed ] = r8_uniform_01 ( seed );
      else
        r = 0.0;
      end
      a(irow,j) = r;
    end
  end
  
  return
end
