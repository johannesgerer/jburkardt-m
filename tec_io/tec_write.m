function tec_write ( tec_file_name, dim_num, node_num, element_num, ...
  element_order, node_data_num, node_coord, element_node, node_data )

%*****************************************************************************80
%
%% TEC_WRITE writes finite element data to a TEC file.
%
%  Discussion:
%
%    This program writes the node, element and data files that define
%    a finite element geometry and data based on that geometry:
%    * a set of nodes, 
%    * a set of elements based on those nodes, 
%    * a set of data values associated with each node.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, string TEC_FILE_NAME, the name of the TEC file.
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, integer NODE_DATA_NUM, the number of data items per node.
%
%    Input, real NODE_COORD(DIM_NUM,NODE_NUM), the coordinates of nodes.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM); 
%    the global index of local node I in element J.
%
%    Input, real NODE_DATA(NODE_DATA_NUM,NODE_NUM), the data values associated
%    with each node.
%
  tec_file_unit = fopen ( tec_file_name, 'wt' );
%
%  Write the title.
%
  fprintf ( tec_file_unit, 'TITLE = "%s"\n', tec_file_name );
%
%  Write the variable names.
%
  fprintf ( tec_file_unit, 'VARIABLES = ' );

  name = 'X';
  for dim = 1 : dim_num
    if ( dim == 1 ) 
      fprintf ( tec_file_unit, '"%s"', name );
    else
      fprintf ( tec_file_unit, ', "%s"', name );
    end
    name = s_inc ( name );
  end

  name = 'data_001';
  for dim = 1 : node_data_num
    fprintf ( tec_file_unit, ', "%s"', name );
    name = file_name_inc ( name );
  end

  fprintf ( tec_file_unit, '\n' );
%
%  Write the ZONE record.
%
  if ( dim_num == 2 & element_order == 3 )
    zonetype = 'FETRIANGLE';
  elseif ( dim_num == 2 & element_order == 4 )
    zonetype = 'FEQUADRILATERAL';
  elseif ( dim_num == 3 & element_order == 4 )
    zonetype = 'FETETRAHEDRON';
  elseif ( dim_num == 3 & element_order == 8 )
    zonetype = 'FEBRICK';
  else
    zonetype = 'FEUNKNOWN';
  end

  fprintf ( tec_file_unit, 'ZONE N = %d, E = %d, ', node_num, element_num );
  fprintf ( tec_file_unit, 'DATAPACKING = POINT, ZONETYPE = %s\n', ...
    zonetype );
%
%  Write the node coordinates and node data.
%
  for node = 1 : node_num
    for dim = 1 : dim_num
      fprintf ( tec_file_unit, '  %10f', node_coord(dim,node) );
    end
    for data = 1 : node_data_num
      fprintf ( tec_file_unit, '  %10f', node_data(data,node) );
    end
    fprintf ( tec_file_unit, '\n' );
  end
%
%  Write the element-node connectivity.
%
  for element = 1 : element_num
    for order = 1 : element_order
      fprintf ( tec_file_unit, '  %6d', element_node(order,element) );
    end
    fprintf ( tec_file_unit, '\n' );
  end

  fclose ( tec_file_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEC_WRITE wrote all data to "%s".\n', ...
    tec_file_name );

  return
end
