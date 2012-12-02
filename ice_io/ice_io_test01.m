function ice_io_test01 ( data_function, filename )

%*****************************************************************************80
%
%% ICE_IO_TEST01 writes an ICE grid dataset to a NETCDF file.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Russ Rew, Glenn Davis, Steve Emmerson, Harvey Davies, Ed Hartne,
%    The NETCDF User's Guide,
%    Unidata Program Center, March 2009.
%
%  Parameters:
%
%    Input, [] function DATA_FUNCTION, a function which defines the
%    data for an ice sheet grid.
%
%    Input, string FILENAME, the name of the file to be created.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ICE_IO_TEST01:\n' );
  fprintf ( 1, '  Create an ICE grid dataset, print it,\n' );
  fprintf ( 1, '  and write it to an NETCDF file.\n' );
%
%  Get data defining a grid.
%
  [ dim, vertices, vertex_coordinate, vertex_label, edges, ...
    edge_vertex, edge_label, triangles, triangle_vertex, triangle_label, ...
    quadrilaterals, quadrilateral_vertex, quadrilateral_label, tetrahedrons, ...
    tetrahedron_vertex, tetrahedron_label, hexahedrons, hexahedron_vertex, ...
    hexahedron_label ] = data_function ( );
%
%  Print the data.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Data to be written to "%s":\n', filename );

  ice_print ( dim, vertices, vertex_coordinate, ...
    vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
    triangle_label, quadrilaterals, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
    hexahedrons, hexahedron_vertex, hexahedron_label );
%
%  Create the file.
%
  ice_write ( filename, dim, vertices, vertex_coordinate, ...
    vertex_label, edges, edge_vertex, edge_label, triangles, triangle_vertex, ...
    triangle_label, quadrilaterals, quadrilateral_vertex, ...
    quadrilateral_label, tetrahedrons, tetrahedron_vertex, tetrahedron_label, ...
    hexahedrons, hexahedron_vertex, hexahedron_label );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Created the file "%s"\n', filename );

  return
end
