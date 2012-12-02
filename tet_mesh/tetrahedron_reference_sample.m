function [ p, seed ] = tetrahedron_reference_sample ( n, seed )

%*****************************************************************************80
%
%% TETRAHEDRON_REFERENCE_SAMPLE samples points in the reference tetrahedron.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the  number of points to sample.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real P(3,N), random points in the tetrahedron.
%
%    Output, integer SEED, a seed for the random number generator.
%
  for j = 1 : n

    [ r, seed ] = r8_uniform_01 ( seed );
%
%  Interpret R as a percentage of the tetrahedron's volume.
%
%  Imagine a plane, parallel to face 1, so that the volume between
%  vertex 1 and the plane is R percent of the full tetrahedron volume.
%
%  The plane will intersect sides 12, 13, and 14 at a fraction
%  ALPHA = R^1/3 of the distance from vertex 1 to vertices 2, 3, and 4.
%
    alpha = r^( 1.0 / 3.0 );
%
%  Determine the coordinates of the points on sides 12, 13 and 14 intersected
%  by the plane, which form a triangle TR.
%
%  Now choose, uniformly at random, a point in this triangle.
%
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
    beta = sqrt ( r );
%
%  Determine the coordinates of the points on sides 2 and 3 intersected
%  by line L.
%
%  Now choose, uniformly at random, a point on the line L.
%
    [ gamma, seed ] = r8_uniform_01 ( seed );

    p(1:3,j) = [ ...
      alpha * ( 1.0 - beta ) *         gamma, ...
      alpha *         beta   * ( 1.0 - gamma ), ...
      alpha *         beta   *         gamma ]';

  end

  return
end
