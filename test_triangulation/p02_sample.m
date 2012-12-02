function [ point, seed ] = p02_sample ( m, n, seed )

%*****************************************************************************80
%
%% P02_SAMPLE samples points from the region in problem 02.
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
  r2 = 0.4;
%
%  Choose uniform random angles between 0 and 2*Pi.
%
  [ angle, seed ] = r8vec_uniform_01 ( n, seed );

  angle(1:n) = 2.0 * pi * angle(1:n);
%
%  Choose uniform random radii between R2**2 and R1**2, then take square root.
%
  [ r, seed ] = r8vec_uniform_01 ( n, seed );
  r(1:n) = r2 * r2 + ( r1 * r1 - r2 * r2 ) * r(1:n);
  r(1:n) = sqrt ( r(1:n) );
%
%  Construct the uniformly random points in the circle of radius 1 
%  centered at 0.
%
  point(1,1:n) = center(1) + r(1:n) .* cos ( angle(1:n) );
  point(2,1:n) = center(2) + r(1:n) .* sin ( angle(1:n) );

  return
end
