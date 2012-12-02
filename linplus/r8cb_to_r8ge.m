function b = r8cb_to_r8ge ( n, ml, mu, a )

%*****************************************************************************80
%
%% R8CB_TO_R8GE copies a R8CB matrix to a R8GE matrix.
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
%    23 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrices.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths of A.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A(ML+MU+1,N), the R8CB matrix.
%
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( j-mu <= i & i <= j+ml )
        b(i,j) = a(mu+1+i-j,j);
      else
        b(i,j) = 0.0;
      end
    end
  end

  return
end
