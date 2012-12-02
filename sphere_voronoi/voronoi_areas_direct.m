function area = voronoi_areas_direct ( d_num, d_xyz, face_num, face_d, v_xyz )

%*****************************************************************************80
%
%% VORONOI_AREAS_DIRECT computes the area of each polygon in a Voronoi diagram.
%
%  Discussion:
%
%    This algorithm works directly from the Delaunay triangulation and the
%    Voronoi vertex locations, without having to determine the explicit
%    description of each Voronoi polygon as a list of Voronoi vertices.
%    This means this routine should be significantly faster than
%    VORONOI_AREAS, at least for larger problems.
%
%
%    The Delaunay triangle has vertices D1, D2, D3, and a Voronoi vertex
%    V which we imagine is inside the triangle, although in fact it need
%    not be.
%
%    Include now the Delaunay vertex averages, D12, D23, and D31, and
%    the Delaunay triangle can be divided into 3 pieces, contributing to
%    the Voronoi polygons associated with D1, D2 and D3 as follows:
%
%      D1 gets D1:V:D31 + D1:D12:V
%      D2 gets D2:V:D12 + D2:D23:V
%      D3 gets D3:V:D23 + D3:D31:V
%
%    The advantage of computing things this way is that it can be done
%    directly from the Delaunay triangle information.  If we must first
%    determine the explicit list of Voronoi vertices that form a particular
%    Voronoi polygon, then compute the area, it is cumbersome and expensive
%    to determine this connectivity information.
%
%    Presumably, if things have been done correctly, the cases where
%    the Voronoi vertex is outside of the Delaunay triangle will correspond
%    to situations where some of the areas come out negative, and 
%    sum to the correct final result.
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
%    Input, integer D_NUM, the number of data points and Voronoi polygons.
%
%    Input, real D_XYZ(3,D_NUM), the coodinates of the data points.
%
%    Input, integer FACE_NUM, the number of faces, and Voronoi vertices.
%
%    Input, integer FACE_D(3,FACE_NUM), the data points that form
%    each triangle.
%
%    Input, real V_XYZ(3,FACE_NUM), the coordinates of the Voronoi vertices.
%
%    Output, real AREA(D_NUM), the area of each Voronoi polygon.
%
  area = zeros ( d_num, 1 );

  r = 1.0;
%
%  Consider each triangle.
%
  for face = 1 : face_num
%
%  Define some things.
%
    p1 = face_d(1,face);
    p2 = face_d(2,face);
    p3 = face_d(3,face);

    d1 = d_xyz ( 1:3, p1 );
    d2 = d_xyz ( 1:3, p2 );
    d3 = d_xyz ( 1:3, p3 );

    d12 = 0.5 * ( d1 + d2 );
    d23 = 0.5 * ( d2 + d3 );
    d31 = 0.5 * ( d3 + d1 );
    v = v_xyz(1:3,face);
%
%  Force all points to lie on the sphere.
%
    d12 = d12 / norm ( d12 );
    d23 = d23 / norm ( d23 );
    d31 = d31 / norm ( d31 );
    v = v / norm ( v );
%
%  Compute orientation and area of the 6 subtriangles.
%
    o1a = stri_vertices_to_orientation ( d1, v, d31 );
    a1a = stri_vertices_to_area ( r, d1, v, d31 );
    o1b = stri_vertices_to_orientation ( d1, d12, v );
    a1b = stri_vertices_to_area ( r, d1, d12, v );

    o2a = stri_vertices_to_orientation ( d2, v, d12 );
    a2a = stri_vertices_to_area ( r, d2, v, d12 );
    o2b = stri_vertices_to_orientation ( d2, d23, v );
    a2b = stri_vertices_to_area ( r, d2, d23, v );

    o3a = stri_vertices_to_orientation ( d3, v, d23 );
    a3a = stri_vertices_to_area ( r, d3, v, d23 );
    o3b = stri_vertices_to_orientation ( d3, d31, v );
    a3b = stri_vertices_to_area ( r, d3, d31, v );
%
%  Contribute to the Voronoi areas.
%
    area(p1) = area(p1) + o1a * a1a + o1b * a1b;
    area(p2) = area(p2) + o2a * a2a + o2b * a2b;
    area(p3) = area(p3) + o3a * a3a + o3b * a3b;

  end

  return
end
