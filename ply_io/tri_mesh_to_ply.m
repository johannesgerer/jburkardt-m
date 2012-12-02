function ply_data = tri_mesh_to_ply ( node_xyz, triangle_node )

%*****************************************************************************80
%
%% TRI_MESH_TO_PLY converts TRI_MESH data to PLY form.
%
%  Discussion:
%
%    This routine converts data from the TRI_MESH to PLY format.
%    Specifically, given a 3 by NODE_NUM array of node coordinates,
%    and a 3 by TRIANGLE_NUM array of node indices that form triangles,
%    the routine creates a MATLAB data structure corresponding to
%    the data in a PLY file.
%
%    The PLY data can be written to a PLY file using the PLY_WRITE
%    routine.
%
%  Example:
%
%    The following TRI_MESH data describes the surface of a pyramid:
%
%      node_xyz = [ 0,0,0; 1,0,0; 1,1,0; 0,1,0; 0.5,0.5,1.6 ]';
%
%      triangle_node = [ 2,1,4; 2,4,3; 1,2,5; 1,5,4; 4,5,3; 2,3,5 ]';
%
%    It can be viewed with these MATLAB commands:
%
%      trisurf ( triangle_node', node_xyz(1,:), node_xyz(2,:), node_xyz(3,:) );
%      axis equal;
%
%    The TRI_MESH data can be converted to PLY format:
%
%      ply_data = tri_mesh_to_ply ( node_xyz, triangle_node );
%
%    The PLY data can be written to a PLY file.
%
%      ply_write ( ply_data, 'pyramid.ply', 'ascii' );
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2007
%
%  Author:
%
%    Pascal Getreuer, 2004
%    Modifications by John Burkardt
%
%  Parameters:
%
%    Input, real NODE_XYZ(3,NODE_NUM) is the coordinates of the nodes.
%
%    Input, integer TRIANGLE_NODE(3,TRIANGLE_NUM) is the node indices that
%    form each triangle.  The node indices are 1-based.
%
%    Output, data structure PLY_DATA, the information
%    about the triangular mesh, suitable for storage as a PLY file.
%
  if ( nargin < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_MESH_TO_PLY - Fatal error!\n' );
    fprintf ( 1, '  Not enough input arguments.\n' );
    fprintf ( 1, '  Input must include NODE_XYZ and TRIANGLE_NODE.\n' );
    error ( 'TRI_MESH_TO_PLY - Not enough input arguments.' );
  end

  if ( size ( node_xyz, 1 ) ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_MESH_TO_PLY - Fatal error!\n' );
    fprintf ( 1, '  NODE_XYZ must have 3 rows.\n' );
    error ( 'TRI_MESH_TO_PLY - NODE_XYZ must have 3 rows.' ); 
  end

  if ( size ( triangle_node, 1 ) ~= 3 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_MESH_TO_PLY - Fatal error!\n' );
    fprintf ( 1, '  TRIANGLE_NODE must have 3 rows.\n' );
    error ( 'TRI_MESH_TO_PLY - TRIANGLE_NODE must have 3 rows.' ); 
  end
%
%  Store the coordinates of the vertices into the PLY_DATA structure.
%
  node_num = size ( node_xyz, 2 );

  ply_data.vertex.x = node_xyz(1,1:node_num);
  ply_data.vertex.y = node_xyz(2,1:node_num);
  ply_data.vertex.z = node_xyz(3,1:node_num);
%
%  Store the indices of the vertices that form the (triangular)
%  faces.
%
  triangle_num = size ( triangle_node, 2 );

  ply_data.face.vertex_indices = cell ( triangle_num, 1 );
%
%  Since PLY uses 0-based indices, we need to subtract 1 from each.
%
  for k = 1 : triangle_num
    ply_data.face.vertex_indices{k} = triangle_node(:,k) - 1;
  end

  return
end
