function twod_to_vtu ( xy, e_conn, uvp, output_filename, title )

%*****************************************************************************80
%
%% TWOD_TO_VTU writes out a TWOD FEM flow solution to a VTU file.
%
%  Discussion:
%
%    The VTU file can be read and displayed by the Paraview program.
%
%    Thanks to Mike Sussman for suggesting that real data should be
%    written with the "FLOAT64" attribute rather than the "FLOAT32",
%    JVB, 20 December 2010.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real XY(NODE_NUM,2), the node coordinates.
%
%    Input, integer E_CONN(ELEMENT_NUM,ELEMENT_ORDER), the nodes that
%    form each element.  Node indices are 1-based.
%
%    Input, real UVP(NODE_NUM,3), U and V velocity components and 
%    pressure at each node.
%
%    Input, string OUTPUT_FILENAME, the name of the output file.
%    By convention, this file should have the extension ".vtu".
%
%    Input, string TITLE, a title for the data.
%

%
%  Determine the sizes of things.
%
  [ node_num, dim_num ] = size ( xy );
  [ element_num,  element_order ] = size ( e_conn );
%
%  Open the output file.
%
  if ( isempty ( output_filename ) )
    output_filename = 'ns2d_fem.vtu';
  end

  output_unit = fopen ( output_filename, 'w' );
%
%  Transpose or otherwise modify the data.
%
  xyz = zeros ( 3, node_num );
  xyz(1:2,1:node_num) = xy(1:node_num,1:2)';

  element_node = zeros ( element_order, element_num );
  element_node(1:element_order,1:element_num) = ...
    e_conn(1:element_num,1:element_order)' - 1;

  p = zeros ( 1, node_num );
  p(1,1:node_num) = uvp(1:node_num,3)';

  uvw = zeros ( 3, node_num );
  uvw(1:2,1:node_num) = uvp(1:node_num,1:2)';
%
%  Write the data.
%
  vtu_puv_write ( output_unit, title, node_num, element_num, ...
    element_order, xyz, element_node, p, uvw );

  fclose ( output_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to "%s"\n', output_filename );

  return
end
function vtu_puv_write ( output_unit, title, node_num, element_num, ...
  element_order, xyz, element_node, p, uvw )

%*****************************************************************************80
%
%% VTU_PUV_WRITE writes pressure and velocity data to a VTU file.
%
%  Discussion:
%
%    The data is assumed to have been computed by a finite element program
%    for a 3D geometry which has been meshed using triangular elements 
%    of 3 or 6 nodes.
%
%    The solution data includes the pressure and velocity vector at each node.
%
%    The VTU format used here is the modern XML-based format used by the
%    Visual Toolkit for unstructured grid data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 December 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OUTPUT_UNIT, the output unit.
%
%    Input, string TITLE, a title for the data.
%
%    Input, integer NODE_NUM, the number of nodes.
%
%    Input, integer ELEMENT_NUM, the number of elements.
%
%    Input, integer ELEMENT_ORDER, the order of the elements.
%
%    Input, real XYZ(3,NODE_NUM), the node coordinates.
%
%    Input, integer ELEMENT_NODE(ELEMENT_ORDER,ELEMENT_NUM), the
%    nodes that make up each element.  The node indices are zero based.
%
%    Input, real P(1,NODE_NUM), the pressure at each node.
%
%    Input, real UVW(3,NODE_NUM), the velocity at each node.
%
  fprintf ( output_unit, '<VTKFile type="unstructuredGrid" version="0.1" byte_order="BigEndian">\n' );
  fprintf ( output_unit, '  <UnstructuredGrid>\n' );
  fprintf ( output_unit, '    <Piece NumberOfPoints="%d" NumberOfCells="%d">\n', ...
    node_num, element_num );
  fprintf ( output_unit, '      <PointData Scalars="scalars">\n' );
  fprintf ( output_unit, '        <DataArray type="Float64" Name="pressure" Format="ascii">\n' );
  for node = 1 : node_num
    fprintf ( output_unit, '%f\n', p(1,node) );
  end
  fprintf ( output_unit, '        </DataArray>\n' );
  fprintf ( output_unit, '        <DataArray type="Float64" NumberOfComponents="3" Name="velocity" Format="ascii">\n' );
  for node = 1 : node_num
    fprintf ( output_unit, '%f  %f  %f\n', uvw(1:3,node) );
  end
  fprintf ( output_unit, '        </DataArray>\n' );
  fprintf ( output_unit, '      </PointData>\n' );
  fprintf ( output_unit, '      <Points>\n' );
  fprintf ( output_unit, '        <DataArray type="Float64" NumberOfComponents="3" Format="ascii">\n' );
  for node = 1 : node_num
    fprintf ( output_unit, '%f  %f  %f\n', xyz(1:3,node) );
  end
  fprintf ( output_unit, '        </DataArray>\n' );
  fprintf ( output_unit, '      </Points>\n' );
  fprintf ( output_unit, '      <Cells>\n' );

  fprintf ( output_unit, '        <DataArray type="Int32" Name="connectivity" Format="ascii">\n' );
  for element = 1 : element_num
    for order = 1 : element_order
      fprintf ( output_unit, '  %d', element_node(order,element) );
    end
    fprintf ( output_unit, '\n' );
  end
  fprintf ( output_unit, '        </DataArray>\n' );

  fprintf ( output_unit, '        <DataArray type="Int32" Name="offsets" Format="ascii">\n' );
  offset = 0;
  for element = 1 : element_num
    offset = offset + element_order;
    fprintf ( output_unit, '%d\n', offset );
  end
  fprintf ( output_unit, '        </DataArray>\n' );
  fprintf ( output_unit, '        <DataArray type="Int32" Name="types" Format="ascii">\n' );
  if ( element_order == 3 )
    for element = 1 : element_num
      fprintf ( output_unit, '5\n' );
    end
  elseif ( element_order == 6 )
    for element = 1 : element_num
      fprintf ( output_unit, '22\n' );
    end
  end
  fprintf ( output_unit, '        </DataArray>\n' );

  fprintf ( output_unit, '      </Cells>\n' );
  fprintf ( output_unit, '    </Piece>\n' );
  fprintf ( output_unit, '  </UnstructuredGrid>\n' );
  fprintf ( output_unit, '</VTKFile>\n' );

  return
end
