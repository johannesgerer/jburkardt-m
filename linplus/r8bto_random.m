function [ a, seed ] = r8bto_random ( m, l, seed )

%*****************************************************************************80
%
%% R8BTO_RANDOM randomizes a R8BTO matrix.
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
%    16 February 2005
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A1(M,M,2*L-1), the R8BTO matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for i = 1 : m
    for j = 1 : m
      for k = 1 : 2 * l - 1
        [ a(i,j,k), seed ] = r8_uniform_01 ( seed );
      end
    end
  end

  return
end
