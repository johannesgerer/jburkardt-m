function [ a, seed ] = r85_random ( n, seed )

%*****************************************************************************80
%
%% R85_RANDOM randomizes a R85 matrix.
%
%  Discussion:
%
%    The R85 storage format represents a pentadiagonal matrix as a 5 
%    by N array, in which each row corresponds to a diagonal, and 
%    column locations are preserved.  Thus, the original matrix is 
%    "collapsed" vertically into the array.
%
%  Example:
%
%    Here is how a R85 matrix of order 6 would be stored:
%
%       *   *  A13 A24 A35 A46
%       *  A12 A23 A34 A45 A56
%      A11 A22 A33 A44 A55 A66
%      A21 A32 A43 A54 A65  *
%      A31 A42 A53 A64  *   *
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
%    Input, integer N, the order of the linear system.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(5,N), the R85 matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%  
  a(1,1) = 0.0;
  a(1,2) = 0.0;
  for j = 3 : n
    [ a(1,j), seed ] = r8_uniform_01 ( seed );
  end

  a(2,1) = 0.0;
  for j = 2 : n
    [ a(2,j), seed ] = r8_uniform_01 ( seed );
  end

  for j = 1 : n
    [ a(3,j), seed ] = r8_uniform_01 ( seed );
  end

  for j = 1 : n-1
    [ a(4,j), seed ] = r8_uniform_01 ( seed );
  end
  a(4,n) = 0.0;

  for j = 1 : n-2
    [ a(5,j), seed ] = r8_uniform_01 ( seed );
  end
  a(5,n-1) = 0.0;
  a(5,n) = 0.0;

  return
end
