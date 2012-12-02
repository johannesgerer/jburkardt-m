function a = r8bto_indicator ( m, l )

%*****************************************************************************80
%
%% R8BTO_INDICATOR sets up a R8BTO indicator matrix.
%
%  Discussion:
%
%    The R8BTO storage format is for a block Toeplitz matrix. The matrix
%    can be regarded as an L by L array of blocks, each of size M by M.
%    The full matrix has order N = M * L.  The L by L matrix is Toeplitz,
%    that is, along its diagonal, the blocks repeat.
%
%    Storage for the matrix consists of the L blocks of the first row,
%    followed by the L-1 blocks of the first column (skipping the first row).
%    These items are stored in the natural way in an (M,M,2*L-1) array.
%
%  Example:
%
%    M = 2, L = 3
%
%    1 2 | 3 4 | 5 6
%    5 5 | 6 6 | 7 7
%    ----+-----+-----
%    7 8 | 1 2 | 3 4
%    8 8 | 5 5 | 6 6
%    ----+-----+-----
%    9 0 | 7 8 | 1 2
%    9 9 | 8 8 | 5 5
%
%    X = (/ 1, 2, 3, 4, 5, 6 /)
%
%    B = (/ 91, 134, 73, 125, 97, 129 /)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    24 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the order of the blocks of the matrix A.
%
%    Input, integer L, the number of blocks in a row or column of A.
%
%    Output, real A(M,M,2*L-1), the R8BTO matrix.
%
  fac = 10^( i4_log_10 ( m * l ) + 1 );
%
%  Blocks 1 to L form the first row.
%
  j = 0;

  for k = 1 : l

    for j2 = 1 : m
      j = j + 1;
      for i = 1 : m
        a(i,j2,k) = fac * i + j;
      end
    end
  end
%
%  Blocks L+1 through 2*L-1 form the remainder of the first column.
%
  i = m;

  for k = l+1 : 2*l-1

    for i2 = 1 : m
      i = i + 1;
      for j = 1 : m
        a(i2,j,k) = fac * i + j;
      end
    end

  end

  return
end
