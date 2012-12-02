function point_xyz = bezier_patch_evaluate ( node_num, node_xyz, ...
  rectangle_num, rectangle_node, patch, point_num, point_uv )

%*****************************************************************************80
%
%% BEZIER_PATCH_EVALUATE evaluates a Bezier patch.
%
%  Discussion:
%
%    Given a Bezier surface defined as a collection of patches,
%    it is desired to evaluate the surface, in a single patch,
%    for a variety of (U,V) parameter values.
%
%    The user specifies the patch index, and the (U,V) coordinates of
%    several points.  The routine returns the (X,Y,Z) coordinates of the
%    points.  The special parameter values (0,0), (1,0), (0,1) and (1,1) should
%    return the coordinates of the SW, SE, NW and NE corners of the patch.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 June 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer NODE_XYZ(3,NODE_NUM), the node coordinates.
%
%    Input, integer RECTANGLE_NUM, the number of rectangles.
%
%    Input, integer RECTANGLE_NODE(16,RECTANGLE_NUM), the nodes that make up
%    each rectangle.
%
%    Input, integer PATCH, the index of the Bezier patch.
%
%    Input, integer POINT_NUM, the number of points at which evaluation
%    is desired.
%
%    Input, real POINT_UV(2,POINT_NUM), the (U,V) parameter
%    coordinates of the points.
%
%    Output, real POINT_XYZ(3,POINT_NUM), the (X,Y,Z)
%    physical coordinates of the points.
%
  patch_xmat(1:4,1) = node_xyz(1,rectangle_node(1:4,patch))';
  patch_xmat(1:4,2) = node_xyz(1,rectangle_node(5:8,patch))';
  patch_xmat(1:4,3) = node_xyz(1,rectangle_node(9:12,patch))';
  patch_xmat(1:4,4) = node_xyz(1,rectangle_node(13:16,patch))';

  patch_ymat(1:4,1) = node_xyz(2,rectangle_node(1:4,patch))';
  patch_ymat(1:4,2) = node_xyz(2,rectangle_node(5:8,patch))';
  patch_ymat(1:4,3) = node_xyz(2,rectangle_node(9:12,patch))';
  patch_ymat(1:4,4) = node_xyz(2,rectangle_node(13:16,patch))';

  patch_zmat(1:4,1) = node_xyz(3,rectangle_node(1:4,patch))';
  patch_zmat(1:4,2) = node_xyz(3,rectangle_node(5:8,patch))';
  patch_zmat(1:4,3) = node_xyz(3,rectangle_node(9:12,patch))';
  patch_zmat(1:4,4) = node_xyz(3,rectangle_node(13:16,patch))';

  for point = 1 : point_num

    u = point_uv(1,point);
    v = point_uv(2,point);

    uvec(1:4) = [              ( 1.0 - u )^3, ...
                   3.0 * u   * ( 1.0 - u )^2, ...
                   3.0 * u^2 * ( 1.0 - u ),   ...
                         u^3 ];

    vvec(1:4) = [              ( 1.0 - v )^3, ...
                   3.0 * v   * ( 1.0 - v )^2, ...
                   3.0 * v^2 * ( 1.0 - v ),   ...
                         v^3 ];

    point_xyz(1,point) = uvec(1:4) * ( patch_xmat(1:4,1:4) * vvec(1:4)' );

    point_xyz(2,point) = uvec(1:4) * ( patch_ymat(1:4,1:4) * vvec(1:4)' );

    point_xyz(3,point) = uvec(1:4) * ( patch_zmat(1:4,1:4) * vvec(1:4)' );

  end

  return
end
