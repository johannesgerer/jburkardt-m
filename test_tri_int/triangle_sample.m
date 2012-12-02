function [ p, seed ] = triangle_sample ( t, n, seed )

%*****************************************************************************80
%
%% TRIANGLE_SAMPLE returns random points in a triangle.
%
%  Discussion:
%
%    In order to compare the results of this program with the
%    C++ and FORTRAN90 versions, it is useful to use R8VEC_UNIFORM_01
%    to generate the random numbers.  However, it is much faster
%    to rely on MATLAB's RAND routine to do this.  So if speed
%    is a consideration, replace the calls to R8VEC_UNIFORM_01
%    as indicated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
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
%
%  For fast execution, call RAND:
%
  alpha = rand ( 1, n );
%
%  For comparison with  F90 and C++, call R8VEC_UNIFORM:
%
% [ alpha, seed ] = r8vec_uniform_01 ( n, seed );
%
%  Interpret R as a percentage of the triangle's area.
%
%  Imagine a line L, parallel to side 1, so that the area between
%  vertex 1 and line L is R percent of the full triangle's area.
%
%  The line L will intersect sides 2 and 3 at a fraction
%  ALPHA = SQRT ( R ) of the distance from vertex 1 to vertices 2 and 3.
%
  alpha(1:n) = sqrt ( alpha(1:n) );
%
%  Determine the coordinates of the points on sides 2 and 3 intersected
%  by line L.
%
  for dim = 1 : dim_num
    p12(dim,1:n) = ( 1.0 - alpha(1:n) ) * t(dim,1) ...
                         + alpha(1:n)   * t(dim,2);

    p13(dim,1:n) = ( 1.0 - alpha(1:n) ) * t(dim,1) ...
                         + alpha(1:n)   * t(dim,3);
  end
%
%  Now choose, uniformly at random, a point on the line L.
%
%  For fast execution, call RAND:
%
  alpha = rand ( 1, n );
%
%  For comparison with  F90 and C++, call R8VEC_UNIFORM:
%
% [ alpha, seed ] = r8vec_uniform_01 ( n, seed );

  for dim = 1 : dim_num
    p(dim,1:n) = ( 1.0 - alpha(1:n) ) .* p12(dim,1:n) ...
                       + alpha(1:n)   .* p13(dim,1:n);
  end

  return
end
