function [ dim_num, node_num, order_num, triangle_num ] = tri_surface_size ( ...
  node_file_name, triangle_file_name )

%*****************************************************************************80
%
%% TRI_SURFACE_SIZE determines the size of a TRI_SURFACE object.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string NODE_FILE_NAME, the name of the node file.
%
%    Input, string TRIANGLE_FILE_NAME, the name of the triangle file.
%
%    Output, integer DIM_NUM, the spatial dimension.
%
%    Output, integer NODE_NUM, the number of nodes.
%
%    Output, integer ORDER_NUM, the order of the triangles.
%
%    Output, integer TRIANGLE_NUM, the number of triangles.
%
  dim_num = -1;
  node_num = -1;
  triangle_num = -1;

  [ dim_num, node_num ] = r8mat_header_read ( node_file_name );

  if ( dim_num < 2 || 3 < dim_num ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_SIZE - Warning!\n' );
    fprintf ( 1, '  The spatial dimension DIM_NUM = %d\n', dim_num );
    fprintf ( 1, '  This seems an unlikely value.\n' );
  end

  [ order_num, triangle_num ] = i4mat_header_read ( triangle_file_name );
 
  if ( order_num ~= 3 & order_num ~= 6 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRI_SURFACE_SIZE - Fatal error!\n' );
    fprintf ( 1, '  The "order" of the triangles seems to be %d\n', order_num );
    fprintf ( 1, '  Only the values 3 and 6 are acceptable.\n' );
    error ( 'TRI_SURFACE_SIZE - Fatal error!\n' );
  end

  return
end
