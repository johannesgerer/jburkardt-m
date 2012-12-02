function [ edge_pointer, edge_data, xy ] = grf_data_read ( input_filename, ...
  node_num, edge_num )

%*****************************************************************************80
%
%% GRF_DATA_READ reads the data of a GRF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 January 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Stephen Skiena,
%    Implementing Discrete Mathematics,
%    Combinatorics and Graph Theory with Mathematica,
%    Addison-Wesley, 1990.
%
%  Parameters:
%
%    Input, string INPUT_FILENAME, the name of the file.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer EDGE_NUM, the number of edges.
%
%    Output, integer EDGE_POINTER(NODE_NUM+1), pointers to
%    the beginning of edge data for each node.
%
%    Output, integer EDGE_DATA(EDGE_NUM), the edge data.
%
%    Output, real XY(2,NODE_NUM), the node coordinates.
%
  edge_data(1:edge_num) = -1;
  edge_pointer(1:node_num+1) = -1;
  xy(1:2,1:node_num) = Inf;
%
%  Open the file.
%
  input_unit = fopen ( input_filename, 'rt' );

  if ( input_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'GRF_DATA_READ - Error!\n' );
    fprintf ( 1, '  Could not open the input file "%s".\n', input_filename );
    error ( 'GRF_DATA_READ - Error!' );
  end
%
%  Read information about each node.
%
  edge = 0;
  edge_pointer(1) = 1;

  while ( 1 )

    text = fgets ( input_unit );

    if ( text == -1 )
      break;
    end
    
    if ( text(1) == '#' )
      continue;
    end

    if ( s_len_trim ( text ) == 0 )
      continue;
    end

    [ temp, count ] = sscanf ( text, '%f' );

    node_i = temp(1);

    edge_pointer(node_i+1) = edge_pointer(node_i);
%
%  Extract the X, Y coordinates of the node.
%
    xy(1,node_i) = temp(2);
    xy(2,node_i) = temp(3);
%
%  Read the indices of the nodes to which the node is connected.
%
    for i = 4 : count

      edge = edge + 1;
      node_j = temp(i);
      edge_data(edge) = node_j;
      edge_pointer(node_i+1) = edge_pointer(node_i+1) + 1;

    end

  end

  fclose ( input_unit );

  return
end
