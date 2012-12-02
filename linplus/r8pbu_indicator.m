function a = r8pbu_indicator ( n, mu )

%*****************************************************************************80
%
%% R8PBU_INDICATOR sets up a R8PBU indicator matrix.
%
%  Discussion:
%
%    The R8PBU storage format is for a symmetric positive definite band matrix.
%
%    To save storage, only the diagonal and upper triangle of A is stored,
%    in a compact diagonal format that preserves columns.
%
%    The diagonal is stored in row MU+1 of the array.
%    The first superdiagonal in row MU, columns 2 through N.
%    The second superdiagonal in row MU-1, columns 3 through N.
%    The MU-th superdiagonal in row 1, columns MU+1 through N.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 February 2004
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
%    Input, integer MU, the number of superdiagonals in the matrix.
%    MU must be at least 0 and no more than N-1.
%
%    Output, real A(MU+1,N), the R8PBU matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );
%
%  Zero out the "junk" entries.
%
  for j = 1 : mu
    for i = 1 : mu+1-j
      a(i,j) = 0.0;
    end
  end
%
%  Set the meaningful values.
%
  for i = 1 : n
    for j = i : min ( i+mu, n )
      a(mu+1+i-j,j) = fac * i + j;
    end
  end

  return
end
