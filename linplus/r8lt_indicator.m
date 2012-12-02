function a = r8lt_indicator ( m, n )

%*****************************************************************************80
%
%% R8LT_INDICATOR sets up a R8LT indicator matrix.
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
%    09 February 2004
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
%    Output, real A(M,N), the R8LT matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  for i = 1 : m
    for j = 1 : min ( i, n )
      a(i,j) = fac * i + j;
    end
    for j = i+1 : n
      a(i,j) = 0.0;
    end
  end

  return
end
