function b = r8ut_mxv ( m, n, a, x )

%*****************************************************************************80
%
%% R8UT_MXV multiplies a R8UT matrix times a vector.
%
%  Discussion:
%
%    The R8UT storage format is used for an M by N upper triangular 
%    matrix.  The format stores all M*N entries, even those which are zero.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2004
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
%    Input, real A(M,N), the R8UT matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(M), the product A * x.
%
  for i = 1 : m
    b(i) = 0.0;
    for j = i : n
      b(i) = b(i) + a(i,j) * x(j);
    end
  end

  return
end
