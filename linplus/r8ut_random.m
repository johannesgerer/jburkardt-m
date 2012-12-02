function [ a, seed ] = r8ut_random ( m, n, seed )

%*****************************************************************************80
%
%% R8UT_RANDOM randomizes a R8UT matrix.
%
%  Discussion:
%
%    The R8UT storage format is used for an M by N upper triangular 
%    matrix.  The format stores all M*N entries, even those which are zero.
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
%    Output, real A(M,N), the R8UT matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%
  for i = 1 : m
    for j = 1 : min ( i-1, n )
      a(i,j) = 0.0;
    end
    for j = i : n
      [ a(i,j), seed ] = r8_uniform_01 ( seed );
    end
  end

  return
end
