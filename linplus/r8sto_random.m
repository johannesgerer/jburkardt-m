function [ a, seed ] = r8sto_random ( n, seed )

%*****************************************************************************80
%
%% R8STO_RANDOM randomizes a R8STO matrix.
%
%  Discussion:
%
%    The R8STO storage format is used for a symmetric Toeplitz matrix.
%    It stores the N elements of the first row.
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
%    Output, real A(N), the R8STO matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  [ a, seed ] = r8vec_uniform_01 ( n, seed );

  return
end
