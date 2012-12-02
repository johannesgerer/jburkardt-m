function [ a, seed ] = r8ge_random ( m, n, seed )

%*****************************************************************************80
%
%% R8GE_RANDOM randomizes a R8GE matrix.
%
%  Discussion:
%
%    The R8GE storage format is used for a general M by N matrix.  A storage 
%    space is made for each logical entry.  The two dimensional logical
%    array is mapped to a vector, in which storage is by columns.
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
%    Input, integer M, the number of rows of the matrix.
%    M must be positive.
%
%    Input, integer N, the number of columns of the matrix.
%    N must be positive.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(M,N), the R8GE matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for j = 1 : n
    for i = 1 : m
      [ a(i,j), seed ] = r8_uniform_01 ( seed );
    end
  end

  return
end
