function [ a, seed ] = r8to_random ( n, seed )

%*****************************************************************************80
%
%% R8TO_RANDOM randomizes a R8TO matrix.
%
%  Discussion:
%
%    The R8TO storage format is used for a Toeplitz matrix, which is constant
%    along diagonals.  Thus, in an N by N Toeplitz matrix, there are at most 
%    2*N-1 distinct entries.  The format stores the N elements of the first
%    row, followed by the N-1 elements of the first column (skipping the
%    entry in the first row).
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
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(2*N-1), the R8TO matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%
  [ a, seed ] = r8vec_uniform_01 ( 2*n-1, seed );

  return
end
