function a = r8pbl_indicator ( n, mu )

%*****************************************************************************80
%
%% R8PBL_INDICATOR sets up a R8PBL indicator matrix.
%
%  Discussion:
%
%    The R8PBL storage format is for a symmetric positive definite band matrix.
%
%    To save storage, only the diagonal and lower triangle of A is stored,
%    in a compact diagonal format that preserves columns.
%
%    The diagonal is stored in row 1 of the array.
%    The first subdiagonal in row 2, columns 1 through MU.
%    The second subdiagonal in row 3, columns 1 through MU-1.
%    The MU-th subdiagonal in row MU+1, columns 1 through 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 February 2004
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
%    Input, integer MU, the number of subdiagonals in the matrix.
%    MU must be at least 0 and no more than N-1.
%
%    Output, real A(MU+1,N), the R8PBL matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );
%
%  Zero out the "junk" entries.
%
  for j = n+1-mu : n
    for i = n+1 : j+mu
      a(i-j+1,j) = 0.0;
    end
  end
%
%  Set the meaningful values.
%
  for i = 1 : n
    for j = max ( 1, i - mu ) : i
      a(i-j+1,j) = fac * i + j;
    end
  end

  return
end
