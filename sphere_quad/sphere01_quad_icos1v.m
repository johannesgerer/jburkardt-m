function [ result, node_num ] = sphere01_quad_icos1v ( factor, fun )

%*****************************************************************************80
%
%% SPHERE01_QUAD_ICOS1V: vertex rule, subdivide then project.
%
%  Discussion:
%
%    This function estimates an integral over the surface of the unit sphere.
%
%    This function sets up an icosahedral grid, and subdivides each
%    edge of the icosahedron into FACTOR subedges.  These edges define a grid
%    within each triangular icosahedral face.  The vertices of these
%    triangles can be determined.  All of these calculations are done,
%    essentially, on the FLAT faces of the icosahedron.  Only then are
%    the triangle vertices projected to the sphere.
%
%    The resulting grid of spherical triangles is used to apply a vertex
%    quadrature rule over the surface of the unit sphere.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FACTOR, the subdivision factor, which must
%    be at least 1.
%
%    Input, function v = FUN ( n, x ), evaluates the integrand.
%
%    Output, real RESULT, the estimated integral.
%
%    Output, integer NODE_NUM, the number of evaluation points.
%

%
%  Size the icosahedron.
%
  [ point_num, edge_num, face_num, face_order_max ] = icos_size ( );
%
%  Set the icosahedron.
%
  [ point_coord, edge_point, face_order, face_point ] = icos_shape ( ...
    point_num, edge_num, face_num, face_order_max );
%
%  Initialize the integral data.
%
  result = 0.0;
  node_num = 0;
  area_total = 0.0;
%
%  Consider each face.
%
  for face = 1 : face_num

    a = face_point(1,face);
    b = face_point(2,face);
    c = face_point(3,face);

    a_xyz(1:3) = point_coord(1:3,a);
    b_xyz(1:3) = point_coord(1:3,b);
    c_xyz(1:3) = point_coord(1:3,c);
%
%  Deal with subtriangles that have same orientation as face.
%
    for f1 = 0 : factor - 1
      for f2 = 0 : factor - f1 - 1
        f3 = factor - f1 - f2;

        a2_xyz = sphere01_triangle_project ( ...
          a_xyz, b_xyz, c_xyz, f1 + 1, f2,     f3 - 1 );
        b2_xyz = sphere01_triangle_project ( ...
          a_xyz, b_xyz, c_xyz, f1,     f2 + 1, f3 - 1 );
        c2_xyz = sphere01_triangle_project ( ...
          a_xyz, b_xyz, c_xyz, f1,     f2,     f3 );

        area = sphere01_triangle_vertices_to_area ( a2_xyz, b2_xyz, c2_xyz );

        node_num = node_num + 3;
        va = fun ( 1, a2_xyz );
        vb = fun ( 1, b2_xyz );
        vc = fun ( 1, c2_xyz );
        result = result + area * ( va + vb + vc ) / 3.0;
        area_total = area_total + area;

      end
    end
%
%  Deal with subtriangles that have opposite orientation as face.
%
    for f3 = 0 : factor - 2
      for f2 = 1 : factor - f3 - 1
        f1 = factor - f2 - f3;

        a2_xyz = sphere01_triangle_project ( ...
          a_xyz, b_xyz, c_xyz, f1 - 1, f2,     f3 + 1 );
        b2_xyz = sphere01_triangle_project ( ...
          a_xyz, b_xyz, c_xyz, f1,     f2 - 1, f3 + 1 );
        c2_xyz = sphere01_triangle_project ( ...
          a_xyz, b_xyz, c_xyz, f1,     f2,     f3 );

        area = sphere01_triangle_vertices_to_area ( a2_xyz, b2_xyz, c2_xyz );

        node_num = node_num + 3;
        va = fun ( 1, a2_xyz );
        vb = fun ( 1, b2_xyz );
        vc = fun ( 1, c2_xyz );
        result = result + area * ( va + vb + vc ) / 3.0;
        area_total = area_total + area;

      end
    end
  end

  return
end
