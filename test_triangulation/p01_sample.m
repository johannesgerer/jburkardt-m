function [ point, seed ] = p01_sample ( m, n, seed )

%*****************************************************************************80
%
%% P01_SAMPLE samples points from the region in problem 01.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real POINT(M,N), the coordinates 
%    of the points.
%
%    Output, integer SEED, a seed for the random number generator.
%
  center = [ 0.0, 0.0 ];
  r1 = 1.0;
%
%  Choose uniform random angles between 0 and 2*Pi.
%
  [ angle, seed ] = r8vec_uniform_01 ( n, seed );

  angle(1:n) = 2.0 * pi * angle(1:n);
%
%  Choose uniform random radii, then take square root.
%
  [ r, seed ] = r8vec_uniform_01 ( n, seed );
  r(1:n) = sqrt ( r(1:n) );
%
%  Construct the uniformly random points in the circle of radius R1 
%  centered at CENTER.
%
  point(1,1:n) = center(1) + r1 * r(1:n) .* cos ( angle(1:n) );
  point(2,1:n) = center(2) + r1 * r(1:n) .* sin ( angle(1:n) );

  return
end
