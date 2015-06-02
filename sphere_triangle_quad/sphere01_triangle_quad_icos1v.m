function [ result, node_num ] = sphere01_triangle_quad_icos1v ( a_xyz, ...
  b_xyz, c_xyz, factor, fun )

%*****************************************************************************80
%
%% SPHERE01_TRIANGLE_QUAD_ICOS1V: vertex rule, subdivide then project.
%
%  Discussion:
%
%    This function estimates an integral over a spherical triangle on the
%    unit sphere.
%
%    This function sets up an icosahedral grid, and subdivides each
%    edge of the icosahedron into FACTOR subedges.  These edges define a grid
%    within each triangular icosahedral face.   All of these calculations are 
%    done, essentially, on the FLAT faces of the icosahedron.  Only then are
%    the triangle vertices projected to the sphere.  
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
%    Input, function v = fun ( x ), evaluates the integrand at the point X.
%
%    Output, real RESULT, the estimated integral.
%
%    Output, integer NODE_NUM, the number of evaluation points.
%

%
%  Destroy all row vectors.
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
%  Deal with subtriangles that have same orientation as face.
%
  for f1 = 0 : factor - 1
    for f2 = 0 : factor - f1 - 1
      f3 = factor - f1 - f2;

      a2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1 + 1, f2,     f3 - 1 );
      b2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1,     f2 + 1, f3 - 1 );
      c2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1,     f2,     f3 );

      area = sphere01_triangle_vertices_to_area ( a2_xyz, b2_xyz, c2_xyz );

      node_num = node_num + 3;
      va = fun ( a2_xyz );
      vb = fun ( b2_xyz );
      vc = fun ( c2_xyz );
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

      a2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1 - 1, f2,     f3 + 1 );
      b2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1,     f2 - 1, f3 + 1 );
      c2_xyz = sphere01_triangle_project ( a_xyz, b_xyz, c_xyz, f1,     f2,     f3 );

      area = sphere01_triangle_vertices_to_area ( a2_xyz, b2_xyz, c2_xyz );

      node_num = node_num + 3;
      va = fun ( a2_xyz );
      vb = fun ( b2_xyz );   
      vc = fun ( c2_xyz );
      result = result + area * ( va + vb + vc ) / 3.0;
      area_total = area_total + area;

    end
  end

  return
end