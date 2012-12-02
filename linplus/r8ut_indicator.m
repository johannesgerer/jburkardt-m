function a = r8ut_indicator ( m, n )

%*****************************************************************************80
%
%% R8UT_INDICATOR sets up a R8UT indicator matrix.
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
%    Input, integer M, N, the number of rows and columns of the matrix.
%    M and N must be positive.
%
%    Output, real A(M,N), the R8UT matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  for i = 1 : m
    for j = 1 : min ( i-1, n )
      a(i,j) = 0.0;
    end
    for j = i : n
      a(i,j) = fac * i + j;
    end
  end

  return
end
