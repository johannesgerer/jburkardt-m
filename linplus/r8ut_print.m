function r8ut_print ( m, n, a, title )

%*****************************************************************************80
%
%% R8UT_PRINT prints a R8UT matrix.
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
%    07 April 2006
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
%    Input, string TITLE, a title to be printed.
%
  r8ut_print_some ( m, n, a, 1, 1, m, n, title );

  return
end
