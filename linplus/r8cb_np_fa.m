function [ a_lu, info ] = r8cb_np_fa ( n, ml, mu, a )

%*****************************************************************************80
%
%% R8CB_NP_FA factors a R8CB matrix by Gaussian elimination.
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
%    R8CB_NP_FA is a version of the LINPACK routine R8GBFA, modifed to use
%    no pivoting, and to be applied to the R8CB compressed band matrix storage
%    format.  It will fail if the matrix is singular, or if any zero
%    pivot is encountered.
%
%    If R8CB_NP_FA successfully factors the matrix, R8CB_NP_SL may be called
%    to solve linear systems involving the matrix.
%
%    The matrix is stored in a compact version of LINPACK general
%    band storage, which does not include the fill-in entires.
%    The following program segment will store the entries of a banded
%    matrix in the compact format used by this routine:
%
%      m = mu+1
%      do j = 1, n
%        i1 = max ( 1, j-mu )
%        i2 = min ( n, j+ml )
%        do i = i1, i2
%          k = i-j+m
%          a(k,j) = afull(i,j)
%        end do
%      end do
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A(ML+MU+1,N), the compact band matrix.
%
%    Output, real A_LU(ML+MU+1,N), the LU factors of the matrix.
%
%    Output, integer INFO, singularity flag.
%    0, no singularity detected.
%    nonzero, the factorization failed on the INFO-th step.
%
  a_lu(1:ml+mu+1,1:n) = a(1:ml+mu+1,1:n);
%
%  The value of M is MU + 1 rather than ML + MU + 1.
%
  m = mu + 1;
  info = 0;
  ju = 0;

  for k = 1 : n-1
%
%  If our pivot entry A(MU+1,K) is zero, then we must give up.
%
    if ( a_lu(m,k) == 0.0 )
      info = k;
      fprintf ( 1, '\n' );
      fprintf ( 1, 'R8CB_NP_FA - Fatal error!\n' );
      fprintf ( 1, '  Zero pivot on step %d\n', info );
      error ( 'R8CB_NP_FA - Fatal error!' );
      return;
    end
%
%  LM counts the number of nonzero elements that lie below the current
%  diagonal entry, A(K,K).
%
%  Multiply the LM entries below the diagonal by -1/A(K,K), turning
%  them into the appropriate "multiplier" terms in the L matrix.
%
    lm = min ( ml, n-k );
    a_lu(m+1:m+lm,k) = -a_lu(m+1:m+lm,k) / a_lu(m,k);
%
%  MM points to the row in which the next entry of the K-th row is, A(K,J).
%  We then add L(I,K)*A(K,J) to A(I,J) for rows I = K+1 to K+LM.
%
    ju = max ( ju, mu + k );
    ju = min ( ju, n );
    mm = m;

    for j = k+1 : ju
      mm = mm - 1;
      a_lu(mm+1:mm+lm,j) = a_lu(mm+1:mm+lm,j) + a_lu(mm,j) * a_lu(m+1:m+lm,k);
    end

  end

  if ( a_lu(m,n) == 0.0 )
    info = n;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8CB_NP_FA - Fatal error!\n' );
    fprintf ( 1, '  Zero pivot on step %d\n', info );
    error ( 'R8CB_NP_FA - Fatal error!' );
    return;
  end

  return
end
