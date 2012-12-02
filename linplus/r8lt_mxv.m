function b = r8lt_mxv ( m, n, a, x )

%*****************************************************************************80
%
%% R8LT_MXV multiplies a R8LT matrix times a vector.
%
%  Discussion:
%
%    The R8LT storage format is used for an M by N lower triangular matrix,
%    and sets aside storage even for the entries that must be zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2004
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
%    Input, real A(M,N), the R8LT matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(M), the product A * x.
%
  for i = 1 : m
    jmax = min ( i, n );
    b(i) = a(i,1:jmax) * x(1:jmax)';
  end

  return
end
