function [ a, seed ] = r8lt_random ( m, n, seed )

%*****************************************************************************80
%
%% R8LT_RANDOM randomizes a R8LT matrix.
%
%  Discussion:
%
%    The R8LT storage format is used for an M by N lower triangular matrix,
%    and sets aside storage even for the entries that must be zero.
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
%    Input, integer M, N, the number of rows and columns of the matrix.
%    M and N must be positive.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(M,N), the R8LT matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  for i = 1 : m
    for j = 1 : min ( i, n )
      [ a(i,j), seed ] = r8_uniform_01 ( seed );
    end
    for j = i+1 : n
      a(i,j) = 0.0;
    end
  end

  return
end
