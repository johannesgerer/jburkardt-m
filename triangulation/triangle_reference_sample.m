function [ p, seed ] = triangle_reference_sample ( n, seed )

%*****************************************************************************80
%
%% TRIANGLE_REFERENCE_SAMPLE returns random points in the reference triangle.
%
%  Diagram:
%
%       3
%    s  |\
%    i  | \
%    d  |  \
%    e  |   \  side 2
%       |    \
%    3  |     \
%       |      \
%       1-------2
%
%         side 1
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points to generate.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real P(2,N), random points in the triangle.
%
%    Output, integer SEED, a seed for the random number generator.
%
  dim_num = 2;

  for j = 1 : n

    [ r, seed ] = r8_uniform_01 ( seed );
%
%  Interpret R as a percentage of the triangle's area.
%
%  Imagine a line L, parallel to side 1, so that the area between
%  vertex 1 and line L is R percent of the full triangle's area.
%
%  The line L will intersect sides 2 and 3 at a fraction
%  ALPHA = SQRT ( R ) of the distance from vertex 1 to vertices 2 and 3.
%
    alpha = sqrt ( r );
%
%  Now choose, uniformly at random, a point on the line L.
%
    [ beta, seed ] = r8_uniform_01 ( seed );

    p(1,j) = ( 1.0 - beta ) * alpha;
    p(2,j) =         beta   * alpha;

  end

  return
end
