function b = r8pbu_to_r8ge ( n, mu, a )

%*****************************************************************************80
%
%% R8PBU_TO_R8GE copies a R8PBU matrix to a R8GE matrix.
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
%    Input, integer N, the order of the matrices.
%    N must be positive.
%
%    Input, integer MU, the upper bandwidth of A1.
%    MU must be nonnegative, and no greater than N-1.
%
%    Input, real A(MU+1,N), the R8PBU matrix.
%
%    Output, real B(N,N), the R8GE matrix.
%
  for i = 1 : n
    for j = 1 : n
      if ( i <= j & j <= i+mu )
        b(i,j) = a(mu+1+i-j,j);
      elseif ( i-mu <= j & j < i )
        b(i,j) = a(mu+1+j-i,i);
      else
        b(i,j) = 0.0;
      end
    end
  end

  return
end
