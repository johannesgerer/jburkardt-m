function a = r8cb_indicator ( m, n, ml, mu )

%*****************************************************************************80
%
%% R8CB_INDICATOR sets up a R8CB indicator matrix.
%
%  Discussion:
%
%    The R8CB storage format is appropriate for a compact banded matrix.
%    It is assumed that the matrix has lower and upper bandwidths ML and MU,
%    respectively.  The matrix is stored in a way similar to that used
%    by LINPACK and LAPACK for a general banded matrix, except that in
%    this mode, no extra rows are set aside for possible fillin during pivoting.
%    Thus, this storage mode is suitable if you do not intend to factor
%    the matrix, or if you can guarantee that the matrix can be factored
%    without pivoting.
%
%    The original M by N matrix is "collapsed" downward, so that diagonals
%    become rows of the storage array, while columns are preserved.  The
%    collapsed array is logically ML+MU+1 by N.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2004
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
%    Output, real A(ML+MU+1,N), the R8CB matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );
  k = 0;

  for j = 1 : n
    for diag = 1 : ml + mu + 1

      i = diag + j - mu - 1;

      if ( 1 <= i & i <= m & i - ml <= j & j <= i + mu )
        value = fac * i + j;
      else
        k = k + 1;
        value = -k;
      end

      a(diag,j) = value;

    end
  end

  return
end
