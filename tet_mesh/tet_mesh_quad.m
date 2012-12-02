function [ quad_value, region_volume ] = tet_mesh_quad ( node_num, ...
  node_xyz, tet_order, tet_num, tet_node, quad_fun, quad_num, quad_xyz, quad_w )

%*****************************************************************************80
%
%% TET_MESH_QUAD approximates an integral over a tet mesh.
%
%  Discussion:
%
%    The routine will accept tetrahedral meshes of order higher than 4.
%    However, only the first four nodes (the vertices) of each
%    tetrahedron will be used.  This will still produce correct results
%    for higher order tet meshes, as long as the sides of each
%    tetrahedron are flat (linear).
%
%    We assume that the vertices of each tetrahedron are listed first
%    in the description of higher order tetrahedrons.
%
%    The approximation of the integral is made using a quadrature rule 
%    defined on the unit tetrahedron, and supplied by the user.  
%
%    The user also supplies the name of a subroutine, here called "QUAD_FUN", 
%    which evaluates the integrand at a set of points.  The form is:
%
%      function fvec = quad_fun ( n, xyz_vec )
%
%    and it returns in each entry F_VEC(1:N), the value of the integrand
%    at XYZ_VEC(1:3,1:N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 December 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the tet mesh.
%
%    Input, real NODE_XYZ(3,NODE_NUM), the coordinates 
%    of the nodes.
%
%    Input, integer TET_ORDER, the order of tetrahedrons in the tet mesh.
%
%    Input, integer TET_NUM, the number of tetrahedrons in the tet mesh.
%
%    Input, integer TET_NODE(TET_ORDER,TET_NUM), 
%    the nodes making up each tetrahedron.
%
%    Input, function QUAD_FUN ( N, XYZ_VEC), the name of the function that 
%    evaluates the integrand.
%
%    Input, integer QUAD_NUM, the order of the quadrature rule.
%
%    Input, real QUAD_XYZ(3,QUAD_NUM), the abscissas of the 
%    quadrature rule, in the unit tetrahedron.
%
%    Input, real QUAD_W(QUAD_NUM), the weights of the 
%    quadrature rule.
%
%    Output, real QUAD_VALUE, the estimate of the integral
%    of F(X,Y) over the region covered by the tet mesh.
%
%    Output, real REGION_VOLUME, the volume of the region.
%
  quad_value = 0.0;
  region_volume = 0.0;

  for tet = 1 : tet_num

    tet_xyz(1:3,1:4) = node_xyz(1:3,tet_node(1:4,tet));

    tet_volume = tetrahedron_volume ( tet_xyz );

    quad2_xyz = tetrahedron_order4_reference_to_physical ( tet_xyz, 
      quad_num, quad_xyz );

    quad_f = quad_fun ( quad_num, quad2_xyz );

    quad_value = quad_value + tet_volume ...
      * ( quad_w(1:quad_num) * quad_f(1:quad_num)' );

    region_volume = region_volume + tet_volume;

  end

  return
end
