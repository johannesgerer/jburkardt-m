function twod_to_vtk ( xy, e_conn, uvp, output_filename, title )

%*****************************************************************************80
%
%% TWOD_TO_VTK writes out a TWOD dataset to a legacy VTK file.
%
%  Discussion:
%
%    The VTK file can be read and displayed by the Paraview program.
%
%    Thanks to Mike Sussman for suggesting that real data should be
%    written with the "double" attribute rather than the "float",
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
%    By convention, this file should have the extension ".vtk".
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
    output_filename = 'ns2d_fem.vtk';
  end

  output_unit = fopen ( output_filename, 'w' );
%
%  Transpose or otherwise modify the data.
%
  xyz = zeros ( 3, node_num );
  xyz(1:2,1:node_num) = xy(1:node_num,1:2)';

  if ( element_order == 6 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TWO_TO_VTK:\n' );
    fprintf ( 1, '  The input data uses quadratic elements.\n' );
    fprintf ( 1, '  The output data will use linear elements.\n' );
  end

  element_order2 = 3;

  element_node = zeros ( element_order2, element_num );
  element_node(1:element_order2,1:element_num) = ...
    e_conn(1:element_num,1:element_order2)' - 1;

  p = zeros ( 1, node_num );
  p(1,1:node_num) = uvp(1:node_num,3)';

  uvw = zeros ( 3, node_num );
  uvw(1:2,1:node_num) = uvp(1:node_num,1:2)';
%
%  Write the data.
%
  vtk_puv_write ( output_unit, title, node_num, element_num, ...
    element_order2, xyz, element_node, p, uvw );

  fclose ( output_unit );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The data was written to "%s"\n', output_filename );

  return
end
function vtk_puv_write ( output_unit, title, node_num, element_num, ...
  element_order, xyz, element_node, p, uvw )

%*****************************************************************************80
%
%% VTK_PUV_WRITE writes pressure and velocity data to a VTK file.
%
%  Discussion:
%
%    The data is assumed to have been computed by a finite element program
%    for a 2D geometry which has been meshed using triangular elements 
%    of 3 or 6 nodes.
%
%    The solution data includes the pressure and velocity vector at each node.
%
%    Note that the VTK format used here is known as the "legacy" or "old style"
%    format.  It has been superseded by a family of XML based formats.  The
%    appropriate replacement for the VTK format used here is known as "VTU",
%    which is the Visual Toolkit format for unstructured grid data.
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
%    nodes that make up each element.  Node indices are zero-based.
%
%    Input, real P(1,NODE_NUM), the pressure at each node.
%
%    Input, real UVW(3,NODE_NUM), the velocity at each node.
%
  fprintf ( output_unit, '# vtk DataFile Version 2.0\n' );
  fprintf ( output_unit, '%s\n', title );
  fprintf ( output_unit, 'ASCII\n' );
  fprintf ( output_unit, '\n' );
  fprintf ( output_unit, 'DATASET UNSTRUCTURED_GRID\n' );
  fprintf ( output_unit, 'POINTS %d double\n', node_num );

  for node = 1 : node_num
    fprintf ( output_unit, '  %f  %f  %f\n', xyz(1:3,node) );
  end
%
%  Note that CELL_SIZE uses ELEMENT_ORDER+1 because the order of each element
%  is included as a data item.
%
  cell_size = element_num * ( element_order + 1 );

  fprintf ( output_unit, '\n' );
  fprintf ( output_unit, 'CELLS  %d  %d\n', element_num, cell_size );
  for element = 1 : element_num
    fprintf ( output_unit, '  %d', element_order );
    for order = 1 : element_order
      fprintf ( output_unit, '  %d', element_node(order,element) );
    end
    fprintf ( output_unit, '\n' );
  end
%
%  VTK has a cell type 22 for quadratic triangles.  However, we
%  are going to strip the data down to linear triangles for now,
%  which is cell type 5.
%
  fprintf ( output_unit, '\n' );
  fprintf ( output_unit, 'CELL_TYPES %d\n', element_num );

  if ( element_order == 3 )
    for element = 1 : element_num
      fprintf ( output_unit, '5\n' );
    end
  elseif ( element_order == 6 )
    for element = 1 : element_num
      fprintf ( output_unit, '22\n' );
    end
  end

  fprintf ( output_unit, '\n' );
  fprintf ( output_unit, 'POINT_DATA %d\n', node_num );
  fprintf ( output_unit, 'SCALARS pressure double\n' );
  fprintf ( output_unit, 'LOOKUP_TABLE default\n' );
  for node = 1 : node_num
    fprintf ( output_unit, '  %f\n', p(1,node) );
  end
  fprintf ( output_unit, 'VECTORS velocity double\n' );
  for node = 1 : node_num
    fprintf ( output_unit, '  %f  %f  %f\n', uvw(1:3,node) );
  end

  return
end
