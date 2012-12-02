function o = stri_vertices_to_orientation ( a, b, c )

%*****************************************************************************80
%
%% STRI_VERTICES_TO_ORIENTATION seeks the orientation of a spherical triangle.
%
%  Discussion:
%
%    Three points on a sphere actually compute two triangles; typically
%    we are interested in the smaller of the two.
%
%    As long as our triangle is "small", we can define an orientation
%    by comparing the direction of the centroid against the normal
%    vector (C-B) x (A-B).  If the dot product of these vectors
%    is positive, we say the triangle has positive orientation.
%
%    By using information from the triangle orientation, we can correctly
%    determine the area of a Voronoi polygon by summing up the pieces
%    of Delaunay triangles, even in the case when the Voronoi vertex
%    lies outside the Delaunay triangle.  In that case, the areas of
%    some of the Delaunay triangle pieces must be formally negative.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A(3), B(3), C(3), three points on a sphere.
%
%    Output, integer O, is +1 if the spherical triangle is judged to
%    have positive orientation, and -1 otherwise.
%

%
%  Please, column vectors only!
%
  a = a( : );
  b = b( : );
  c = c( : );
%
%  Centroid.
%
  cd = ( a + b + c ) / 3.0;
%
%  Cross product ( C - B ) x ( A - B );
%
  v1 = c - b;
  v2 = a - b;

  cp = zeros ( 3, 1 );
  cp(1) = v1(2) * v2(3) - v1(3) * v2(2);
  cp(2) = v1(3) * v2(1) - v1(1) * v2(3);
  cp(3) = v1(1) * v2(2) - v1(2) * v2(1);
%
%  Compare the directions.
%
  if ( cp' * cd < 0 )
    o = - 1;
  else
    o = + 1;
  end

  return
end
