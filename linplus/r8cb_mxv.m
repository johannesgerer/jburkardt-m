function b = r8cb_mxv ( n, ml, mu, a, x )

%*****************************************************************************80
%
%% R8CB_MXV multiplies a R8CB matrix times a vector.
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
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, real A(ML+MU+1,N), the R8CB matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A * x.
%
  for i = 1 : n
    b(i) = 0.0;
    jlo = max ( 1, i - ml );
    jhi = min ( n, i + mu );
    for j = jlo : jhi
      b(i) = b(i) + a(i-j+mu+1,j) * x(j);
    end
  end

  return
end
