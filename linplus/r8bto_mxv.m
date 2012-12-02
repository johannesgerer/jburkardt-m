function b = r8bto_mxv ( m, l, a, x )

%*****************************************************************************80
%
%% R8BTO_MXV multiplies a R8BTO matrix times a vector.
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
%    B = (/ 91, 134, 73, 125, 79, 138 /)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 March 2004
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
%    Input, real A(M,M,2*L-1), the R8BTO matrix.
%
%    Input, real X(M,L), the vector to be multiplied.
%
%    Output, real B(M,L), the product A * X.
%
  b = zeros ( m, l );
%
%  Construct the right hand side by blocks.
%
  for i = 1 : l

    b(1:m,i) = 0.0E+00;

    for j = 1 : i-1
      b(1:m,i) = b(1:m,i) + a(1:m,1:m,l+i-j) * x(1:m,j);
    end

    for j = i : l
      b(1:m,i) = b(1:m,i) + a(1:m,1:m,j+1-i) * x(1:m,j);
    end

  end

  return
end
