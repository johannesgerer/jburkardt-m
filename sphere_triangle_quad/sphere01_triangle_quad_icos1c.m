function [ result, node_num ] = sphere01_triangle_quad_icos1c ( a_xyz, ...
  b_xyz, c_xyz, factor, fun )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_QUAD_ICOS1C: centroid rule, subdivide then project.
%
%  Discussion:
%
%    This function estimates an integral over a spherical triangle on the
%    unit sphere.
%
%    This function sets up an icosahedral grid, and subdivides each
%    edge of the icosahedron into FACTOR subedges.  These edges define a grid
%    within each triangular icosahedral face.  The centroids of these
%    triangles can be determined.  All of these calculations are done,
%    essentially, on the FLAT faces of the icosahedron.  Only then are
%    the triangle vertices and centroids projected to the sphere.  
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A_XYZ(3), B_XYZ(3), C_XYZ(3), the vertices
%    of the spherical triangle.
%
%    Input, integer FACTOR, the subdivision factor, which must
%    be at least 1.
%
%    Input, function v = FUN ( x ), evaluates the integrand at X.
%
%    Output, real RESULT, the estimated integral.
%
%    Output, integer NODE_NUM, the number of evaluation points.
%

%
%  Destroy all row vectors!
%
  a_xyz = a_xyz(:);
  b_xyz = b_xyz(:);
  c_xyz = c_xyz(:);
%
%  Initialize the integral data.
%
  result = 0.0;
  area_total = 0.0;
  node_num = 0;
%
%  Some subtriangles will have the same direction as the triangle.
%  Generate each in turn, by determining the barycentric coordinates
%  of the centroid (F1,F2,F3), from which we can also work out the barycentric
%  coordinates of the vertices of the subtriangle.
%
  for f3 = 1 : 3 : 3 * factor - 2
    for f2 = 1 : 3 : 3 * factor - f3 - 1

      f1 = 3 * factor - f3 - f2;

      node_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1, f2, f3 );

      a2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1 + 2, f2 - 1, f3 - 1 );
      b2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1 - 1, f2 + 2, f3 - 1 );
      c2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1 - 1, f2 - 1, f3 + 2 );

      area = sphere01_triangle_vertices_to_area ( a2_xyz, b2_xyz, c2_xyz );

      v = fun ( node_xyz ); 

      node_num = node_num + 1;
      result = result + area * v;
      area_total = area_total + area;

    end
  end
%
%  The other subtriangles have the opposite direction from the triangle.
%  Generate each in turn, by determining the barycentric coordinates
%  of the centroid (F1,F2,F3), from which we can also work out the barycentric
%  coordinates of the vertices of the subtriangle.
%
  for f3 = 2 : 3 : 3 * factor - 4
    for f2 = 2 : 3 : 3 * factor - f3 - 2

      f1 = 3 * factor - f3 - f2;

      node_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1, f2, f3 );

      a2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1 - 2, f2 + 1, f3 + 1 );
      b2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1 + 1, f2 - 2, f3 + 1 );
      c2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1 + 1, f2 + 1, f3 - 2 );

      area = sphere01_triangle_vertices_to_area ( a2_xyz, b2_xyz, c2_xyz );

      v = fun ( node_xyz );

      node_num = node_num + 1;
      result = result + area * v;
      area_total = area_total + area;

    end
  end

  return
end