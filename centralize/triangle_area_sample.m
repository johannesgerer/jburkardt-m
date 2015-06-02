function x = triangle_area_sample ( n, v )

%*****************************************************************************80
%
%% TRIANGLE_AREA_SAMPLE samples points from the interior of a triangle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 May 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Greg Turk,
%    Generating Random Points in a Triangle,
%    in Graphics Gems,
%    edited by Andrew Glassner,
%    AP Professional, 1990, pages 24-28.
%
%  Parameters:
%
%    Input, integer N, the number of samples to compute.
%
%    Input, real V(2,3), the vertices.
%
%    Output, real X(2,N), the points.
%
  r = rand ( 2, n );

  c = zeros ( 3, n );

  c(1,1:n) = 1.0                 - sqrt ( r(2,1:n) );
  c(2,1:n) = ( 1.0 - r(1,1:n) ) .* sqrt ( r(2,1:n) );
  c(3,1:n) =         r(1,1:n)   .* sqrt ( r(2,1:n) );

  x = v * c;

  return
end
