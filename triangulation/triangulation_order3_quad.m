function [ quad_value, region_area ] = triangulation_order3_quad ( node_num, ...
  node_xy, triangle_order, triangle_num, triangle_node, quad_fun, quad_num, ...
  quad_xy, quad_w )

%*****************************************************************************80
%
%% TRIANGULATION_ORDER3_QUAD approximates an integral over a triangulation.
%
%  Discussion:
%
%    The routine will accept triangulations of order higher than 3.
%    However, only the first three nodes (the vertices) of each
%    triangle will be used.  This will still produce correct results
%    for higher order triangulations, as long as the sides of the
%    triangle are straight.
%
%    We assume that the vertices of each triangle are listed first
%    in the description of higher order triangles, and we assume that
%    the vertices are listed in counterclockwise order.
%
%    The approximation of the integral is made using a quadrature rule 
%    defined on the unit triangle, and supplied by the user.  
%
%    The user also supplies the name of a function, here called "QUAD_FUN",
%    which evaluates the integrand at a set of points.  The form is:
%
%      function f_vec = quad_fun ( n, xy_vec )
%
%    and it returns in each entry F_VEC(1:N), the value of the integrand
%    at XY_VEC(1:2,1:N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 June 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes in the triangulation.
%
%    Input, real NODE_XY(2,NODE_NUM), the coordinates of the nodes.
%
%    Input, integer TRIANGLE_ORDER, the order of triangles in the triangulation.
%
%    Input, integer TRIANGLE_NUM, the number of triangles in the triangulation.
%
%    Input, integer TRIANGLE_NODE(TRIANGLE_ORDER,TRIANGLE_NUM), 
%    the nodes making up each triangle.
%
%    Input, function FVEC(1:N) = QUAD_FUN( N, XY_VEC(1:2,1:N), the name of the
%    function that evaluates the integrand.
%
%    Input, integer QUAD_NUM, the order of the quadrature rule.
%
%    Input, real QUAD_XY(2,QUAD_NUM), the abscissas of the 
%    quadrature rule, in the unit triangle.
%
%    Input, real QUAD_W(QUAD_NUM), the weights of the 
%    quadrature rule.
%
%    Output, real QUAD_VALUE, the estimate of the integral
%    of F(X,Y) over the region covered by the triangulation.
%
%    Output, real REGION_AREA, the area of the region.
%
  quad_value = 0.0;
  region_area = 0.0;

  for triangle = 1 : triangle_num

    triangle_xy(1:2,1:3) = node_xy(1:2,triangle_node(1:3,triangle));

    triangle_area = triangle_area_2d ( triangle_xy );

    quad2_xy = triangle_order3_reference_to_physical ( triangle_xy, ...
      quad_num, quad_xy );

    quad_f = quad_fun ( quad_num, quad2_xy );

    quad_value = quad_value + triangle_area ...
      * ( quad_w(1:quad_num) * quad_f(1:quad_num)' );

    region_area = region_area + triangle_area;

  end

  return
end
