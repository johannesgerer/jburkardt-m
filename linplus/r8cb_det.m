function det = r8cb_det ( n, ml, mu, a_lu )

%*****************************************************************************80
%
%% R8CB_DET computes the determinant of a R8CB matrix factored by R8CB_NP_FA.
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
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A_LU(ML+MU+1,N), the LU factors from R8CB_NP_FA.
%
%    Output, real DET, the determinant of the matrix.
%
  det = prod ( a_lu(mu+1,1:n) );

  return
end
