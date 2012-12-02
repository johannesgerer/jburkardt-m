function r8bto_print ( m, l, a, title )

%*****************************************************************************80
%
%% R8BTO_PRINT prints a R8BTO matrix.
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
%    Input, integer M, the order of the blocks of the matrix A.
%
%    Input, integer L, the number of blocks in a row or column of A.
%
%    Input, real A(M,M,2*L-1), the R8BTO matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8bto_print_some ( m, l, a, 1, 1, m*l, m*l, title );

  return
end
