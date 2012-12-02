function [ dim_num, node_num, element_num, element_order, node_data_num, ...
  node_coord, element_node, node_data ] = tec_read ( tec_file_name )

%*****************************************************************************80
%
%% TEC_READ reads finite element data from a TEC file.
%
%  Discussion:
%
%    This program reads a TEC file containing finite element data,
%    and writes that data out to three files that constitute an FEM model,
%    that is,
%    * a file of node coordinates;
%    * a file of elements defined by the nodes that form them;
%    * a file of node data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 February 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, character TEC_FILE_NAME(*), the name of the TEC file.
%
%    Output, integer DIM_NUM, the spatial dimension, inferred from the
%    names of the variables.
%
%    Output, integer NODE_NUM, the number of nodes, determined by the 
%    "N=" argument.
%
%    Output, integer ELEMENT_NUM, the number of elements, inferred from the
%    "E=" argument.
%
%    Output, integer ELEMENT_ORDER, the order of the elements, inferred from
%    the "ZONETYPE=" argument.
%
%    Output, integer NODE_DATA_NUM, the number of data items per node,
%    inferred from the the number of node data items, minus those which are
%    inferred to be spatial coordinates.
%
%    Output, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates of nodes.
%
%    Output, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM); 
%    the global index of local node I in element J.
%
%    Output, real NODE_DATA(NODE_DATA_NUM,NODE_NUM), the data values associated
%    with each node.
%
  dim_num = -1;
  node_num = -1;
  element_num = -1;
  element_order = -1; 
  node_data_num = -1;
  node_coord = []; 
  element_node = []; 
  node_data = [];

  tec_file_unit = fopen ( tec_file_name );

  if ( tec_file_unit < 0 ) 
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEC_READ - Error!\n' );
    fprintf ( 1, '  Could not open the file "%s".\n', tec_file_name );
    error ( 'TEC_READ - Error!' );
    return;
  end
%
%  Read and parse the TITLE line.
%  But it is optional, so you may have just read the VARIABLES line instead!
%
  line = ' ';

  while ( s_len_trim ( line ) == 0 )
    line = fgetl ( tec_file_unit );
  end    
%
%  Read the VARIABLES line.
%
%  Because the TITLE line is apparently optional, we may have already
%  read the VARIABLES line!
%
  if ( s_begin ( line, 'TITLE=' ) )
    line = ' ';
    while ( s_len_trim ( line ) == 0 )
      line = fgetl ( tec_file_unit );
    end
  end

  if ( ~s_begin ( line, 'VARIABLES=' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEC_READ - Fatal error!\n' );
    fprintf ( 1, '  The VARIABLES = line is missing in the file.\n' );
    error ( 'TEC_READ - Fatal error!' );
  end
%
%  Parse the VARIABLES line.
%  VARIABLES = name1 name2 name3...
%  The names may be quoted, and are separated by quotes, commas or spaces.
%
  [ variable_num, variable_name_length, variable_name ] ...
    = tec_variable_line_parse ( line );
%
%  Based on the variable names, determine the spatial dimension and the number
%  of node data items.
%
%  For now, we SIMPLY ASSUME that the spatial coordinates are listed first.
%  Hence, when we read the node data, we assume that the first DIM_NUM values
%  represent X, Y and possibly Z.
%
  dim_num = 0;
  node_data_num = variable_num;

  begin = 0;
  for variable = 1 : variable_num
    if ( variable_name_length(variable) == 1 )
      name = variable_name(begin+1);
      if ( ch_eqi ( name, 'X' ) || ... 
          ch_eqi ( name, 'Y' ) || ...
          ch_eqi ( name, 'Z' ) )
        dim_num = dim_num + 1;
        node_data_num = node_data_num - 1;
      end
    end
    begin = begin + variable_name_length(variable);
  end
%
%  Read and parse the ZONE line.
%
  line = ' ';
  while ( s_len_trim ( line ) == 0 )
    line = fgetl ( tec_file_unit );
  end
    
  if ( ~s_begin ( line, 'ZONE' ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TEC_READ - Fatal error!\n' );
    fprintf ( 1, '  The ZONE = line is missing in the file.\n' );
    error ( 'TEC_READ - Fatal error!' );
  end

  [ node_num, element_num, element_type ] = tec_zone_line_parse ( line );
%
%  Based on ELEMENT_TYPE, determine the element order.
%
  if ( s_eqi ( element_type, 'FETRIANGLE' ) )
    element_order = 3;
  elseif ( s_eqi ( element_type, 'FEQUADRILATERAL' ) )
    element_order = 4;
  elseif ( s_eqi ( element_type, 'FETETRAHEDRON' ) )
    element_order = 4;
  elseif ( s_eqi ( element_type, 'FEBRICK' ) )
    element_order = 8;
  else
    element_order = -1;
  end
%
%  Build up the format string for reading DIM_NUM + NODE_DATA_NUM reals.
%
  format = ' ';

  for i = 1 : dim_num + node_data_num
    format = strcat ( format, ' %f' );
  end

  node_coord = zeros ( dim_num, node_num );
  node_data = zeros ( node_data_num, node_num );
%
%  Now read the node coordinates and node data.
%
  for node = 1 : node_num

    line = ' ';
    while ( s_len_trim ( line ) == 0 )
      line = fgetl ( tec_file_unit );
    end

    [ x, count ] = sscanf ( line, format );

    if ( count == dim_num + node_data_num )
      node_coord(1:dim_num,node) = x(1:dim_num);

      node_data(1:node_data_num,node) = x(dim_num+1:dim_num+node_data_num);
    end

  end
%
%  Build up the format string for reading ELEMENT_ORDER integers.
%
  format = ' ';

  for element = 1 : element_order
    format = strcat ( format, ' %d' );
  end

  element_node = zeros ( element_order, element_num );
%
%  Now read the element data.
%
  for element = 1 : element_num

    line = ' ';
    while ( s_len_trim ( line ) == 0 )
      line = fgetl ( tec_file_unit );
    end

    [ x, count ] = sscanf ( line, format );

    if ( count == element_order )
      element_node(1:element_order,element) = x(1:element_order);
    end

  end

  fclose ( tec_file_unit );

  return
end
