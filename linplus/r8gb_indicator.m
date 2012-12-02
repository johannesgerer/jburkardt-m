function a = r8gb_indicator ( m, n, ml, mu )

%*****************************************************************************80
%
%% R8GB_INDICATOR sets up a R8GB indicator matrix.
%
%  Discussion:
%
%    Note that the R8GB storage format includes extra room for
%    fillin entries that occur during Gauss elimination.  This routine
%    will supply zero values for those entries.
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
%    Output, real A(2*ML+MU+1,N), the R8GB matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );
  k = 0;

  for j = 1 : n
    for diag = 1 : 2 * ml + mu + 1

      i = diag + j - ml - mu - 1;

      if ( 1 <= i & i <= m & i - ml <= j & j <= i + mu )
        value = real ( fac * i + j );
      elseif ( 1 <= i & i <= m & i - ml <= j & j <= i + mu + ml )
        value = 0.0;
      else
        k = k + 1;
        value = -k;
      end

      a(diag,j) = value;

    end
  end

  return
end
