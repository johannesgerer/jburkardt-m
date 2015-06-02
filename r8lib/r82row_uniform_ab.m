function [ a, seed ] = r82row_uniform_ab ( n, b, c, seed )

%*****************************************************************************80
%
%% R82ROW_UNIFORM_AB returns a random R82ROW in a given range.
%
%  Discussion:
%
%    An R82ROW is a (2,N) array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the vector.
%
%    Input, real B, C, the minimum and maximum values.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(2,N), the vector of randomly chosen values.
%
%    Output, integer SEED, a seed for the random number generator.
%
  a = zeros ( 2, n );

  m = 2;

  for i = 1 : m
    for j = 1 : n
      [ a(i,j), seed ] = r8_uniform_ab ( b, c, seed );
    end
  end

  return
end
