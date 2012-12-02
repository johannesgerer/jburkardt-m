function b = r8pbl_to_r8ge ( n, mu, a )

%*****************************************************************************80
%
%% R8PBL_TO_R8GE copies a R8PBL matrix to a R8GE matrix.
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
%    Input, integer N, the order of the matrices.
%    N must be positive.
%
%    Input, integer MU, the upper bandwidth of A.
%    MU must be nonnegative, and no greater than N-1.
%
%    Input, real A(MU+1,N), the R8PBL matrix.
%
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i <= j & j <= i + mu )
        b(i,j) = a(j-i+1,i);
      else if ( i - mu <= j & j < i )
        b(i,j) = a(i-j+1,j);
      else
        b(i,j) = 0.0;
      end
    end
  end

  return
end
