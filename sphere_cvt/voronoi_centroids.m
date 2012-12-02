function centroid = voronoi_centroids ( n, first, list_num, list, xyz, v_num, v_xyz )

%*****************************************************************************80
%
%% VORONOI_CENTROIDS computes the centroids of each polygon in a Voronoi diagram.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 May 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data points and Voronoi polygons.
%
%    Input, integer FIRST(N+1), for each polygon, points to the location
%    in LIST of the index.
%
%    Input, integer LIST_NUM, the number of items in LIST.
%
%    Input, integer LIST(LIST_NUM), the indices of vertices that form 
%    each polygon.
%
%    Input, real XYZ(3,N), the coodinates of the data points.
%
%    Input, integer V_NUM, the number of Voronoi vertices.
%
%    Input, real V_XYZ(3,V_NUM), the coordinates of the Voronoi vertices.
%
%    Output, real CENTROID(3,N), the centroid of each Voronoi polygon.
%
  centroid = zeros ( 3, n );

  r = 1.0;

  for poly = 1 : n
%
%  Compute the area of each triangle formed by one side of the polygon
%  and the Delaunay point.
%
    v3 = list(first(poly+1)-1);

    for l = first(poly) : first(poly+1) - 1

      v2 = v3;
      v3 = list(l);

      stri_area = stri_vertices_to_area ( r, ...
        xyz(1:3,poly), v_xyz(1:3,v2), v_xyz(1:3,v3) );

      stri_centroid = stri_vertices_to_centroid ( r, ...
        xyz(1:3,poly), v_xyz(1:3,v2), v_xyz(1:3,v3) );

      centroid(1:3,poly) = centroid(1:3,poly) + stri_area * stri_centroid(1:3,1);

    end

    centroid(1:3,poly) = centroid(1:3,poly) / norm ( centroid(1:3,poly) );

  end

  return
end
