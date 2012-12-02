function node_num = bezier_surface_node_size ( node_file_name )

%*****************************************************************************80
%
%% BEZIER_SURFACE_NODE_SIZE counts nodes in a node file.
%
%  Discussion:
%
%    This version of the routine simply counts the number of lines
%    in the file (although it ignores comment lines beginning with "#").
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
%    Input, string NODE_FILE_NAME, the name of the node file.
%
%    Output, integer NODE_NUM, the number of nodes.
%
  node_num = file_row_count ( node_file_name );

  return
end
