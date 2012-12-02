function order = voronoi_order ( n, face_num, face )

%*****************************************************************************80
%
%% VORONOI_ORDER computes the order of the Voronoi polygons.
%
%  Discussion:
%
%    We are given information defining the Delaunay triangulation of
%    a set of N points on the unit sphere.  
%
%    Each point corresponds to a Voronoi polygon whose order can
%    be determined by the number of triangles that include that point.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    01 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of points.
%
%    Input, integer FACE_NUM, the number of Delaunay triangles.
%
%    Input, integer FACE(3,FACE_NUM), the indices of points that
%    form each Delaunay triangle.
%
%    Output, real ORDER(N), the order of the Voronoi polygons.
%
  subs = reshape ( face, 3 * face_num, 1 );
  vals = ones ( 3 * face_num, 1 );
  order = accumarray ( subs, vals );

  return
end
